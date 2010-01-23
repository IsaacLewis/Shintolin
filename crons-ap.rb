#!/usr/bin/ruby
print "Content-type: text/html\r\n\r\n"

load 'functions.rb'
puts tick_restore_ap
puts tick_campfires
puts tick_move_animals
