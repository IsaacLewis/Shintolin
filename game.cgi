#!/usr/bin/ruby
require 'cgi'
require 'cgi/session'
load 'functions.rb'
$cgi = CGI.new

def input_action(action)
  case action
    when 'add fuel' then add_fuel(UserID)
    when 'attack' then attack($user, $target, $params['item'])
    when 'build' then build($user, $params['building'])
    when 'chat' then chat($user, $params['text'])
    when 'chop tree' then chop_tree(UserID)
    when 'dig' then dig($user)
    when 'craft' then craft($user, $params['item'])
    when 'drop' then drop($user,$params['item'],$params['number'])
    when 'fill' then fill($user)
    when 'give' then  give($user, $target, $params['number'], $params['item'])
    when 'harvest' then harvest($user)
    when 'join settlement' then join($user)
    when 'leave settlement' then leave($user)
    when 'log out' then logout($user)
    when 'move' then move(UserID,$params['x'],$params['y'],$params['z'])
    when 'quarry' then quarry($user)
    when 'refresh' then ''
    when 'say' then say($user,$params['text'],$params['option'],$target)
    when 'settle' then settle($user, $params['text'])
    when 'search' then search($user)
    when 'sow' then sow($user,$params['item'])
    when 'take' then take(UserID, $params['number'],$params['item'])
    when 'use' then use($user, $target, $params['item'])
    when 'water' then water($user)
    when 'write' then write($user, $params['text'])
    else ''
  end
end

UserID = get_validated_id
if UserID != false
  $header = {'cookie' => [$cookie], 'type' => 'text/html'}
else
  puts $cgi.header('Location'=>'index.cgi?msg=bad_pw')
  exit
end

$ip_hits = ip_hit(UserID)
$params = $cgi.str_params

if $params['target'] != nil 
  target_id, target_type = $params['target'].split(':')
  $target =
  case target_type
    when "animal" then Animal.new(target_id)
    when "building"
      x, y = target_id.split(',')
      Building.new(x.to_i, y.to_i)
    when "user" then User.new(target_id)
  end
else
  $target = nil
end

$user = User.new(UserID)
mysql_update('users', UserID, {'active'=>1})

if (can_act?($user) || $params['action'] == 'log out' ||
     $params['action'] == 'chat')
  Action_Outcome = input_action($params['action'])
else
  Action_Outcome = ''
end

if Action_Outcome != ''
  mysql_update('users', $user.mysql_id, {'lastaction'=>:Now})
end

puts $cgi.header($header)
$user = User.new(UserID)
player = mysql_user(UserID)
tile = mysql_tile(player['x'],player['y'])
Dazed_Message = msg_dazed(player)
Tired_Message = msg_tired(player)
Location_Info = describe_location(UserID)
Inventory, Encumberance = html_inventory(UserID)
Messages = html_messages(UserID, player['x'], player['y'], player['z'])
Location_Bar = html_location_box($user)
Map = html_map($user.tile, 5, $user)
Player_Data = html_player_data(UserID)
Action_Forms = html_forms($user)
Logout_Button = html_action_form('Log out', true)

load 'game_display.rb'
