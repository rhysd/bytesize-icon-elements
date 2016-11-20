#!/usr/bin/env ruby

require 'webrick'

def which(cmd)
  exts = ENV['PATHEXT'] ? ENV['PATHEXT'].split(';') : ['']
  ENV['PATH'].split(File::PATH_SEPARATOR).each do |path|
    exts.each { |ext|
      exe = File.join(path, "#{cmd}#{ext}")
      return exe if File.executable?(exe) && !File.directory?(exe)
    }
  end
  return nil
end

def open(cmd)
  which(cmd) && system(cmd + ' "http://localhost:1234"')
end

open('xdg-open') ||
open('open') ||
open('start') ||
STDERR.puts('Open http://localhost:1234 in your browser')

WEBrick::HTTPServer.new(DocumentRoot: './', Port: 1234).start
