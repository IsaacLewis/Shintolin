#!/usr/bin/ruby
print "Content-type: text/html\r\n\r\n"
require 'cgi'
require 'cgi/session'
load 'functions.rb'
$cgi = CGI.new

size = 10
xs = (-5..5).map {|x| x * size}
ys = (-5..5).map {|y| y * size}

$map = '<table>'

ys.each do
  |y|
  y_range = ((y-(size / 2))...(y+(size/2)))
  $map += "\n<tr>\n"
  xs.each do
    |x|
    x_range = ((x-(size / 2))...(x+(size/2)))

    tiles = mysql_select('grid',{'x'=>x_range,'y'=>y_range})
    terrains = values_freqs_hash(tiles, 'terrain')
    most_common = terrains.index(terrains.values.max)
    image = db_field(:terrain, most_common, :image)
    image = image[:default] if image.kind_of? Hash
    image = db_field(:terrain, :wilderness, :image) if image == nil

    $map += "\n<td class=\"map\" " +
    "style=\"background-image:url('#{Image_Folder + image}')\" " +
    '>'

    settlement = mysql_row('settlements',{'x'=>x_range,'y'=>y_range})
    if settlement != nil
      settlement = Settlement.new(settlement['id'])
      link = settlement.link
    else
      link = Tile.new(x,y).region_name end
    $map += "<div class=\"small\">#{link}</div>"
    $map += "\n</td>\n"
  end

  $map += "\n</tr>\n"
end
$map += '</table>'



puts <<ENDTEXT
<html>
<head><title>Shintolin - World</title>
<link rel="stylesheet" type="text/css" href="shintolin.css" />
</head>
<body>
<h1>Map</h1>
<hr>
<a class="buttonlink" href="game.cgi">Return</a>
<hr>
<div class="gamebox-light">
#{$map}
</div>
</body>
</html>
ENDTEXT