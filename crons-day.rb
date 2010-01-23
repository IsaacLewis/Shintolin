#!/usr/bin/ruby
print "Content-type: text/html\r\n\r\n"

load 'functions.rb'
puts tick_change_leader
puts tick_grow_fields
puts tick_inactive
puts tick_restore_search
puts tick_restore_ip
puts tick_spawn_animals
puts tick_terrain_transitions
puts tick_rot_food
puts tick_damage_buildings