#!/usr/bin/env ruby

icons = File.join(__dir__, '..', 'node_modules', 'bytesize-icons', 'dist/icons')
template = File.join(__dir__, 'README_template.md')
readme = File.join(__dir__, '..', 'README_template.md')
list = Dir.glob(File.join(icons, '*.svg'))
  .map{|f| File.basename(f, '.svg')}
  .sort
  .map{|n| "- `<icon-#{n}></icon-#{n}>`"}
  .join("\n")
puts(File.read(template) + list)
