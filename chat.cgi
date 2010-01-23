#!/usr/bin/ruby
print "Content-type: text/html\r\n\r\n"
require 'cgi'
load 'functions.rb'
$cgi = CGI.new
$params = $cgi.str_params

def input_action(action)
  case action
    when 'chat' then chat($user, $params['text'])
  end
end


UserID = get_validated_id
if UserID != false
  $header = {'cookie' => [$cookie], 'type' => 'text/html'}
else
  puts $cgi.header('Location'=>'index.cgi?msg=bad_pw')
  exit
end

$user = User.new(UserID)
input_action $params['action']

puts <<ENDTEXT
<html>
<head profile="http://www.w3.org/2005/10/profile">
<link rel="icon" 
      type="image/png" 
      href="images/favicon.ico">
<link rel=\"stylesheet\" type=\"text/css\" href=\"shintolin.css\"/>
<title>Chat</title>

<body>
<a class="buttonlink" href="game.cgi">Return</a>
<hr>
#{html_chat_box(100)}
</body>
</html>
ENDTEXT
