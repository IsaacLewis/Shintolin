#!/usr/bin/ruby
print "Content-type: text/html\r\n\r\n"
require 'cgi'
require 'cgi/session'
load 'functions.rb'
$cgi = CGI.new

user_id = get_validated_id
$user = User.new(user_id) if user_id

rank = $cgi['metric']
rank = 'frags' if rank == nil

case rank
  when "deaths" then type, metric = "players", "deaths"
  when "frags" 
    type, metric = "players", "frags"
    blurb = "Frags measure not just the number of foes killed, " +
      "but the quality of one's opponents. New players begin with " +
      "one frag, and when a character is knocked out, the attacker " +
      "takes half their frags (rounded up)."

  when "kills" then type, metric = "players", "kills"
  when "points" then type, metric = "players", "points"
  when "revives" then type, metric = "players", "revives"
  when "survival" 
    type, metric, order = "players", "lastrevive", "ASC"
    column = "Last Revived"
    display = Proc.new {|date| Time.str_to_time(date).ago}
    clause = "`hp` != '0' "
  when "oldies" 
    type, metric, order = "players", "joined", "ASC"
    display = Proc.new {|date| Time.str_to_time(date).ago}
  when "younguns"
    type, metric = "players", "joined"
    display = Proc.new {|date| Time.str_to_time(date).ago}

  when "bigtowns" then type, metric = "settlements", "population"
  when "newtowns"
    type, metric = "settlements", "founded"
    display = Proc.new {|date| Time.str_to_time(date).ago}
  when "oldtowns"
    type, metric, order = "settlements", "founded", "ASC"
    display = Proc.new {|date| Time.str_to_time(date).ago}
end

if type == "players"
  order = "DESC" if order == nil
  query = "SELECT * FROM `users`, `accounts` " +
    "WHERE `users`.`id` = `accounts`.`id` " +
    if clause != nil then " AND #{clause} " else '' end +
    "AND `active` = '1' " +
    "ORDER BY `#{metric}` #{order} " +
    "LIMIT 0, 100"
  result = $mysql.query(query)
  i = 1
  column = metric.capitalize if column == nil
  $rankings = "<tr>" +
    "<td><b>Rank</b></td>" +
    "<td><b>Name</b></td>" +
    "<td><b>#{column}</b></td></tr>\n"
  result.each_hash do
    |row|
    user = User.new(row['id'])
    disp =
    if display != nil then display.call(row[metric])
    else row[metric] end
    $rankings += "<tr>\n" +
      "<td>#{i}</td>" +
      "<td>#{user.link}</td>" +
      "<td>#{disp}</td>\n" +
      "<tr>\n"
    i += 1
  end
end

if type == "settlements"
  result = mysql_select_all('settlements')
  settlements = []
  result.each_hash {|row| settlements << Settlement.new(row['id'])}
  settlements.sort! {|x, y| y.send(metric) <=> x.send(metric)}
  settlements.reverse! if order == "ASC"

  column = metric.capitalize if column == nil
  $rankings = "<tr>" +
    "<td><b>Rank</b></td>" +
    "<td><b>Name</b></td>" +
    "<td><b>Region</b></td>" +
    "<td><b>#{column}</b></td></tr>\n"
  settlements.each_with_index do
    |settlement, i|
    disp =
    if display != nil then display.call(settlement.send(metric))
    else settlement.send(metric) end
    $rankings += "<tr>\n" +
      "<td>#{i + 1}</td>" +
      "<td>#{settlement.link}</td>" +
      "<td><i>#{settlement.region_name}</i></td>" +
      "<td>#{disp}</td>\n" +
      "<tr>\n"
  end
end

puts <<ENDTEXT
<html>
<head>
<link rel='stylesheet' type='text/css' href='shintolin.css' />
<title>Shintolin - Rankings</title>
</head>
<body>
<hr>
<a class='buttonlink' href='game.cgi'>Return</a>
<hr>
<form method='get' action='rankings.cgi'>
<b>Rank by:</b> 
<select width='300px' name='metric'>
<option value='frags'>Frags</option>
<option value='deaths'>Deaths</option>
<option value='kills'>Kills</option>
<option value='revives'>Players Revived</option>
<option value='younguns'>Newest players</option>
<option value='oldies'>Oldest players</option>
<option value='survival'>Longest surviving players</option>
<option value=''>-----</option>
<option value='oldtowns'>Oldest Settlements</option>
<option value='newtowns'>Newest Settlements</option>
<option value='bigtowns'>Most Populous Settlements</option>
</select> 
<input type='submit' value='View' />
</form>
<i>#{blurb}</i>
<hr>
<table>
#{$rankings}
</table>

</body>
</html>
ENDTEXT