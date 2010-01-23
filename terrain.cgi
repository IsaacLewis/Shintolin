#!/usr/bin/ruby
print "Content-type: text/html\r\n\r\n"
require 'cgi'
require 'cgi/session'
load 'functions.rb'
$cgi = CGI.new

terrains = db_table(:terrain).values
terrains.sort! {|x, y| x[:id].to_s <=> y[:id].to_s}

terrains.each do
  |t|
  name = id_to_key(:terrain, t[:id])
  puts "#{name}: #{t[:id]}<br>"
end