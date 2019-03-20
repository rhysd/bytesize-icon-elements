#!/usr/bin/env ruby

def read_svg_icons(dir)
  Dir.glob(File.join(dir, '*.svg')).inject({}) do |ret, f|
    ret[File.basename(f, '.svg')] = File.read f
    ret
  end
end

def icon_html_entry_template(name, html)
  html = html.gsub(' width="32"', ' width="${size}"')
    .gsub(' height="32"', ' height="${size}"')
    .gsub(' stroke-linecap="round"', ' stroke-linecap="${linecap}"')
    .gsub(' stroke-linejoin="round"', ' stroke-linejoin="${linejoin}"')
    .gsub(' stroke-width="2"', ' stroke-width="${weight}"')
  if name.include? '-'
    <<-JS
        '#{name}': `#{html}`,
    JS
  else
    <<-JS
        #{name}: `#{html}`,
    JS
  end
end

def generate_icon_html_map(icons)
  icons.map{|n, h| icon_html_entry_template(n, h)}
    .join
    .rstrip
    .chomp(',')
end

icons = read_svg_icons File.join(__dir__, '..', 'node_modules', 'bytesize-icons', 'dist/icons')
raise 'Icons not found' if icons.empty?

puts <<-JS
(function() {
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

  const defaultAttributes = {
    size: '32',
    weight: 'regular',
    style: 'round'
  };

  class BytesizeIcon extends HTMLElement {
    constructor() {
      super();
      const size = this.getAttribute('size') || defaultAttributes.size;
      const weight = weights[this.getAttribute('weight')] || weights[defaultAttributes.weight];
      const style = styles[this.getAttribute('style')] || styles[defaultAttributes.style];
      const { linecap, linejoin } = style;
      const icons = {
#{generate_icon_html_map icons}
      };
      const html = icons[this.getAttribute('name')]; 
      this.innerHTML = html;
    }
  }

  customElements.define('bytesize-icon', BytesizeIcon);

  BytesizeIcon.setDefaultAttributes = function (attributes) {
    Object.assign(defaultAttributes, attributes);
  };

  BytesizeIcon.names = [#{icons.keys.map{|n| "'#{n}'"}.join(', ')}];
  window.BytesizeIcon = BytesizeIcon;
})();
JS
