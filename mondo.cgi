#!/usr/bin/ruby
print "Content-type: text/html\r\n\r\n"
require 'cgi'
require 'cgi/session'
load 'functions.rb'
$cgi = CGI.new

[882,1189,1404,1875].each {|id| mysql_update 'users', id, {'donated'=>1}}

["happy trauma"].each {|id| mysql_update 'users', {'name'=>id}, {'donated'=>1}}
users = mysql_select 'users', {'donated'=>1}

users.each_hash {|u| puts u['name'] + "<br>"}
