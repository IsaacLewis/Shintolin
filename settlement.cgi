#!/usr/bin/ruby
print "Content-type: text/html\r\n\r\n"
require 'cgi'
require 'cgi/session'
load 'functions.rb'
$cgi = CGI.new

def input_action(action)
  case action
    when 'allow_new_users'
      puts $params
      mysql_update('settlements', $params['id'], 
        {'allow_new_users' => $params['option']})
    when 'description'
      mysql_update('settlements', $params['id'], 
        {'description' => insert_breaks($params['text'])})
    when 'image'
      mysql_update('settlements', $params['id'], 
        {'image' => $params['text']})
    when 'motto'
      mysql_update('settlements', $params['id'], 
        {'motto' => $params['text']})
    when 'name'
      mysql_update('settlements', $params['id'], 
        {'name' => $params['text']})
    when 'title'
      mysql_update('settlements', $params['id'], 
        {'title' => $params['text']})
    when 'website'
      mysql_update('settlements', $params['id'], 
        {'website' => $params['text']})

    else ''
  end
end

$params = $cgi.str_params
$settlement = Settlement.new($params['id'])
user_id = get_validated_id
$user = User.new(user_id) if user_id != false

if $settlement.exists?
  $leader = $settlement.leader
  input_action($params['action']) if $leader == $user
  if ($user.exists? && 
      $user.settlement == $settlement && $params['action'] == 'vote')
    $msg = vote($user, User.new($params['option'])) end
  name = $settlement.name
  # bug-fix: have to update settlement reference as input_action may have
  # changed it
  $settlement = Settlement.new($params['id'])
else
  name = 'None'
end

puts <<ENDTEXT
<html>
<head>
<title>Shintolin - #{name}</title>
<link rel='stylesheet' type='text/css' href='shintolin.css' />
</head>
<body>
ENDTEXT

if !$settlement.exists?
  puts 'No settlement found!</body></html>'
  exit
end

puts <<ENDTEXT
<h1 class='header'>#{name}</h1>
<h3 class='header'><i>#{$settlement.motto}</i></h3>
#{$msg}

<table>
  <tr>
  <td colspan='2'>
    <div class='beigebox' style='font-style:italic;width:35em'>
    <b>Website:</b>
    <a href="#{$settlement.website}">#{$settlement.website}</a>
    <br>
    <b>Signup link:</b>
    www.shintolin.co.uk/index.cgi?settlement=#{$settlement.mysql_id}
    <hr>
    #{$settlement.description}
    </div>
  </td>

ENDTEXT

if $user == $leader
  puts <<ENDTEXT
  <td rowspan='3'>
  <div class='beigebox' style='width:25em'>
  <b>Welcome, Great #{$settlement.title}.</b>
  <hr>
  <form method='post' action='settlement.cgi'>
    Edit description:
    <br>
    <textarea rows='5' cols='40' name='text'>#{$settlement.description}</textarea>
    <br><br>
    <input type='hidden' name='action' value='description' />
    <input type='hidden' name='id' value='#{$settlement.mysql_id}' />   
    <input type='submit' value='Submit' />
  </form>

  <hr>

  <form method='post' action='settlement.cgi'>
    Edit name:
    <br>
    <input type='text' class='text' name='text' maxlength='100' style='width:300px' value='#{$settlement.name}'/>
    <input type='hidden' name='action' value='name' />
    <input type='hidden' name='id' value='#{$settlement.mysql_id}' />   
    <input type='submit' value='Submit' />
  </form>

  <form method='post' action='settlement.cgi'>
    Update image <i>(Enter image URL):</i>
    <br>
    <input type='text' class='text' name='text' maxlength='100' style='width:300px' value='#{$settlement.image}'/>
    <input type='hidden' name='action' value='image' />
    <input type='hidden' name='id' value='#{$settlement.mysql_id}' />   
    <input type='submit' value='Submit' />
    <br>
    <i>Images must be hosted on external sites. Offensive content will be removed.</i>
  </form>

  <form method='post' action='settlement.cgi'>
    Edit motto:
    <br>
    <input type='text' class='text' name='text' maxlength='100' style='width:300px' value='#{$settlement.motto}'/>
    <input type='hidden' name='action' value='motto' />
    <input type='hidden' name='id' value='#{$settlement.mysql_id}' />   
    <input type='submit' value='Submit' />
  </form>

  <form method='post' action='settlement.cgi'>
    Edit Leader Title:
    <br>
    <input type='text' class='text' name='text' maxlength='20' style='width:300px' value='#{$settlement.title}'/>
    <input type='hidden' name='action' value='title' />
    <input type='hidden' name='id' value='#{$settlement.mysql_id}' />   
    <input type='submit' value='Submit' />
  </form>

  <form method='post' action='settlement.cgi'>
    Update website <i>(Enter website URL):</i>
    <br>
    <input type='text' class='text' name='text' maxlength='100' style='width:300px' value='#{$settlement.website}'/>
    <input type='hidden' name='action' value='website' />
    <input type='hidden' name='id' value='#{$settlement.mysql_id}' />   
    <input type='submit' value='Submit' />
  </form>

ENDTEXT

if $settlement.allow_new_users == 0
  puts "New characters are unable to join #{$settlement.name}. " +
    "Open #{$settlement.name} to new players?"
else
  puts "#{$settlement.name} is open to new characters. " +
    "Keep #{$settlement.name} open?"
end

puts <<ENDTEXT
  <form method='post' action='settlement.cgi'><br>
    Yes: <input type='radio' name='option' value='1'><br>
    No: <input type='radio' name='option' value='0'><br>
    <input type='hidden' name='id' value='#{$settlement.mysql_id}' />   
    <input type='hidden' name='action' value='allow_new_users' />
    <input type='submit' value='Submit' />
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
    <table >
      <tr>
        <td><b>Region: </td><td>#{$settlement.region_name}</td>
      </tr>
      <tr>
        <td><b>#{$settlement.title}: </td><td>#{$settlement.leader_link}</td>
      </tr>
      <tr>
        <td><b>Population: </td><td>#{$settlement.population}</td>
      </tr>
      <tr>
        <td><b>Founded: </td><td>#{$settlement.founded}</td>
      </tr>
      <tr>
        <td colspan='2'>
	<hr><b><b>Inhabitants: #{describe_list($settlement.inhabitant_links)}
	</td>
      </tr>
    </table>
    </div>
    </td>

    <td>
    <img style='width:300px' src='#{$settlement.image}' alt="Artist's impression of #{$settlement.name}"/>
    </td>
  </tr>
ENDTEXT

if $user != nil && $user.settlement == $settlement
  candidate_ids = $settlement.inhabitant_ids
  select_user = html_select(candidate_ids) {|id| 
    user = User.new id
    "#{user.name} (#{user.supporters} supporters)"}

  puts <<ENDTEXT
  <tr>
  <td colspan='2'>
  <div class='beigebox'>
    As a resident of #{$settlement.name}, you may support someone for leader.
    <form action='settlement.cgi' method='post'>
      #{select_user}
    <input type='hidden' name='id' value='#{$settlement.mysql_id}' />
    <input type='hidden' name='action' value='vote' />
    <input type='Submit' value='Pledge Support' />
    </form>
  </div>
  </td>
  </tr>
ENDTEXT
end

puts <<ENDTEXT
</table>

<hr>
<a class='buttonlink' href='game.cgi'>Return</a>

</body>
</html>
ENDTEXT