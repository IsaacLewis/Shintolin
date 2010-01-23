#!/usr/bin/ruby
print "Content-type: text/html\r\n\r\n"
require 'cgi'
require 'cgi/session'
load 'functions.rb'
$cgi = CGI.new

def input_action(action)
  case action
    when 'description'
      mysql_update('accounts', $user.mysql_id, 
        {'description' => insert_breaks($params['text'])})
    when 'image'
      mysql_update('accounts', $user.mysql_id, 
        {'image' => $params['text']})
    else ''
  end
end

$params = $cgi.str_params
profile = User.new($params['id'])
user_id = get_validated_id
$user = User.new(user_id) if user_id != false

if !profile.exists? then name = ''
else name = profile.name end

input_action($params['action']) if $user == profile
# bug-fix: have to update profile reference as input_action may have
# changed it
profile = User.new($params['id'])

puts <<ENDTEXT
<html>
<head>
<title>Shintolin - #{name}</title>
<link rel='stylesheet' type='text/css' href='shintolin.css' />
</head>
<body>
ENDTEXT

if !profile.exists?
  puts "No user found!</body></html>"
  exit
end

puts <<ENDTEXT

<h1 class='header'>#{name}</h1>

<table>
  <tr>
    <td colspan='2'>
    <div class='beigebox' style='font-style:italic;width:35em'>
    #{profile.description}
    </div>
  </td>
ENDTEXT

if $user == profile
  puts <<ENDTEXT
  <td rowspan='2'>
  <div class='beigebox' style='width:25em'>
  <form method='post' action='profile.cgi'>
    Edit description:
    <br>
    <textarea rows='5' cols='40' name='text'>#{$user.description}</textarea>
    <br><br>
    <input type='hidden' name='action' value='description' />
    <input type='hidden' name='id' value='#{$user.mysql_id}' />   
    <input type='submit' value='Submit' />
  </form>

  <hr>
  <form method='post' action='profile.cgi'>
    Update image <i>(Enter image URL):</i>
    <br>
    <input type='text' class='text' name='text' maxlength='100' style='width:300px' value='#{profile.image}'/>
    <input type='hidden' name='action' value='image' />
    <input type='hidden' name='id' value='#{$user.mysql_id}' />   
    <input type='submit' value='Submit' />
    <br>
    <i>Images must be hosted on external sites. Offensive content will be removed.</i>
  </form>
  </div>
  </td>
ENDTEXT
end

puts <<ENDTEXT
  </tr>

  <tr>
    <td>
    <div class='beigebox'>
    <table>
ENDTEXT

puts "<tr><td><b><i>Donated!</i></b></td></tr>" if profile.donated?

puts <<ENDTEXT
      <tr>
        <td><b>Settlement: </td>
	<td>#{profile.settlement.link}
ENDTEXT

if $user == profile && $user.settlement_id != 0
  puts html_action_form('Leave Settlement', :inline)
end

puts <<ENDTEXT
	</td>
      </tr>
      <tr>
        <td><b>Level: </td><td>#{profile.level}</td>
      </tr>
      <tr>
        <td><b>Played since: </td><td>#{profile.joined}</td>
      </tr>
ENDTEXT

if profile.hp != 0
  puts "<tr><td><b>Alive since: </td><td>#{profile.lastrevive}</td></tr>"
else
  puts '<tr><td><b>Alive since: </td><td><i>Dazed</i></td></tr>'
end

puts <<ENDTEXT

      <tr>
        <td><b>Frags: </td><td>#{profile.frags}</td>
      </tr>
      <tr>
        <td><b>Kills: </td><td>#{profile.kills}</td>
      </tr>
      <tr>
        <td><b>Deaths: </td><td>#{profile.deaths}</td>
      </tr>
      <tr>
        <td><b>Revives: </td><td>#{profile.revives}</td>
      </tr>
    </table>
    </div>
    </td>

    <td>
    <img style='width:300px' src='#{profile.image}' alt='Portrait of #{profile.name}'/>
    </td>
  </tr>
</table>

<hr>
<a class='buttonlink' href='game.cgi'>Return</a>

</body>
</html>
ENDTEXT
