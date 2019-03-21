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
  <<-JS
  class #{klass} extends HTMLElement {
    constructor() {
      super();
      setupIconElement(this, `#{html}`);
    }
  }
  window.BytesizeIcons.#{klass} = #{klass};
  customElements.define('icon-#{name}', #{klass});
  JS
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

  function setupIconElement(self, html) {
    self.innerHTML = html;
    const child =  self.getElementsByTagName('svg')[0];
    const size = self.getAttribute('size') || '32';
    child.setAttribute('width', size);
    child.setAttribute('height', size);
    const weight = weights[self.getAttribute('weight')];
    if (weight) {
      child.setAttribute('stroke-width', weight);
    }
    const style = styles[self.getAttribute('style')];
    if (style) {
      child.setAttribute('stroke-linejoin', style.linejoin);
      child.setAttribute('stroke-linecap', style.linecap);
    }
  }

#{generate_custom_elements icons}

  window.BytesizeIcons.ICON_NAMES = [#{icons.keys.map{|n| "'#{n}'"}.join(', ')}];
})();
JS
