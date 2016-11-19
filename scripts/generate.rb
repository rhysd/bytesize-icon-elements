#!/usr/bin/env ruby

require 'json'

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
      this.innerHTML = `#{html}`;
      const child =  this.getElementsByTagName('svg')[0];
      const w = this.getAttribute('width');
      if (w) {
        child.setAttribute('width', w);
      } else {
        child.setAttribute('width', '32');
      }
      const h = this.getAttribute('height');
      if (h) {
        child.setAttribute('height', w);
      } else {
        child.setAttribute('height', '32');
      }
      const t = this.getAttribute('type');
      if (t) {
        const s = typeToWidth[t];
        if (s) this.setAttribute('stroke-width', s);
      }
    }
  }
  mod.#{klass} = #{klass};
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
  let mod = window;
  if (typeof exports !== 'undefined') {
    mod = exports;
  }

  const typeToWidth = {
    'ultra-light': '1.5625%',
    thin: '3.125%',
    light: '4.6875%',
    regular: '6.25%',
    medium: '7.8125%',
    bold: '9.375%',
    heavy: '10.9375%'
  };

#{generate_custom_elements icons}

  mod.ICON_NAMES = #{JSON.generate(icons.keys)};
})();
JS
