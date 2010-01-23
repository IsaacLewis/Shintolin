#!/usr/bin/ruby
print "Content-type: text/html\r\n\r\n"
require 'cgi'
require 'cgi/session'
load 'functions.rb'
$cgi = CGI.new
$params = $cgi.str_params

def input_action(action)
  case action
    when "north"
      $y = $y - ($size - 1)
    when "south"
      $y = $y + ($size - 1)
    when "west"
      $x = $x - ($size - 1)
    when "east"
      $x = $x + ($size - 1)

    when "edit"
      coords_re = /(-?[0-9]+),(-?[0-9]+)/
      $params.each do
        |name, value| 
	coords = coords_re.match(name)
	next if !coords
	x, y = coords[1], coords[2]
	update_tile(x, y, value)
      end
  end
end

def update_tile(x, y, new_terrain)
  x, y, new_terrain = x.to_i, y.to_i, new_terrain.to_i
  tile = Tile.new(x, y)
  if !tile.exists? && new_terrain != 3
    mysql_insert('grid',{'x'=>x,'y'=>y,
      'terrain'=>new_terrain,'region_id'=>$params['option']})
  else
      if tile.terrain == new_terrain
      nil
    else
      mysql_update('grid',{'x'=>x,'y'=>y},
        {'terrain'=>new_terrain,'region_id'=>$params['option']})
    end
  end
end

$x = $params['x'].to_i || 0
$y = $params['y'].to_i || 0
$size = $params['size'].to_i
$size = 19 if $size == 0
input_action($params['action'])
$tile = Tile.new($x, $y)

Hidden =
  html_hidden('x',$x) + html_hidden('y',$y) + 
  html_hidden('size',$size)

Map = html_map($tile, $size, nil, :no_occupants) do
  |tile|
  "<div class=\"small\">#{tile.region_name}</div>" +
  "<input type=\"text\" " +
  "class=\"text\" " +
  "name=\"#{tile.x},#{tile.y}\" " +
  "maxlength=\"3\" " +
  "style=\"width:3em\" " +
  "value=\"#{tile.terrain}\" /><br>"
end

Move_Forms =
  html_action_form('West',:inline,nil,'edit-map.cgi') {Hidden} +
  html_action_form('North',:inline,nil,'edit-map.cgi') {Hidden} +
  html_action_form('South',:inline,nil,'edit-map.cgi') {Hidden} +
  html_action_form('East',:inline,nil,'edit-map.cgi') {Hidden}

regions = db_table(:region).values
region_ids = regions.map {|r| r[:id]}

Region_Select =
  html_select(region_ids, $params['option'].to_i) do
    |id| db_field(:region, id, :name) end

puts <<ENDTEXT
<html>
<head><title>Shintolin - Edit Map</title>
<link rel="stylesheet" type="text/css" href="shintolin.css" />
</head>
<body>
<h1>Edit Map</h1>
<a class='buttonlink' href='game.cgi'>Return</a>
<hr>
#{Move_Forms}
<hr>
<form action="edit-map.cgi" method="post">
<input type="Submit" value="Update" />
<input type="hidden" name="action" value="edit" />
#{Hidden}
 | #{Region_Select} <i>(Edited tiles will join this region)</i>
<hr>
#{Map}
</body>
</html>
ENDTEXT

