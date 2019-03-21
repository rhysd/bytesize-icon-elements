#!/usr/bin/env ruby

def read_svg_icons(dir)
  Dir.glob(File.join(dir, '*.svg')).inject({}) do |ret, f|
    ret[File.basename(f, '.svg')] = File.read f
    ret
  end
end

def to_class(name)
  name.split('-').map(&:capitalize).join
end

def registration_template(name, html)
  klass = to_class name
  declaration = <<-JS
  class #{klass} extends HTMLElement {
    constructor() {
      super();
  JS
  html = html.gsub(' width="32"', ' width="${size}"')
    .gsub(' height="32"', ' height="${size}"')
  # Github and Twitter icons lack width, linecap and linejoin stroke attributes.
  if html.include? ' stroke-linecap'
    html = html.gsub(' stroke-linecap="round"', ' stroke-linecap="${linecap}"')
      .gsub(' stroke-linejoin="round"', ' stroke-linejoin="${linejoin}"')
      .gsub(' stroke-width="2"', ' stroke-width="${weight}"')
    declaration += <<-JS
      const { size, weight, linecap, linejoin } = getAttributes.call(this);
    JS
  else
    declaration += <<-JS
      const size = getSize.call(this);
    JS
  end
  declaration += <<-JS
      this.innerHTML = `#{html}`;
    }
  }
  window.BytesizeIcons.#{klass} = #{klass};
  customElements.define('icon-#{name}', #{klass});
  JS
  declaration
end

def generate_custom_elements(icons)
  icons.map{|n, h| registration_template(n, h)}.join("\n")
end

icons = read_svg_icons File.join(__dir__, '..', 'node_modules', 'bytesize-icons', 'dist/icons')
raise 'Icons not found' if icons.empty?

js = File.join(__dir__, '..', 'index.js')
test = File.join(__dir__, '..', 'icon_names.js')

puts <<-JS
(function() {
  window.BytesizeIcons = {};

  const weights = {
    'ultra-light': '1.5625%',
    thin: '3.125%',
    light: '4.6875%',
    regular: '6.25%',
    medium: '7.8125%',
    bold: '9.375%',
    heavy: '10.9375%'
  };

  const styles = {
    round: {
      linejoin: 'round',
      linecap: 'round',
    },
    bevel: {
      linejoin: 'bevel',
      linecap: 'butt',
    },
    miter: {
      linejoin: 'miter',
      linecap: 'butt',
    }
  };

  function getAttributes () {
    const size = getSize.call(this);
    const weight = weights[this.getAttribute('weight')] || weights['regular'];
    const style = styles[this.getAttribute('style')] || styles['round'];
    const { linecap, linejoin } = style;
    return { size, weight, linecap, linejoin };
  }

  function getSize () {
    return this.getAttribute('size') || '32';
  }

#{generate_custom_elements icons}
  window.BytesizeIcons.ICON_NAMES = [#{icons.keys.map{|n| "'#{n}'"}.join(', ')}];
})();
JS
