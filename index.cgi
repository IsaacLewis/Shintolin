#!/usr/bin/ruby
print "Content-type: text/html\r\n\r\n"
require 'cgi'
load 'mysql-connect.rb'
load 'functions-mysql.rb'
mysql_connect
$cgi = CGI.new

def settlement_box
  settlements = mysql_select('settlements',{'allow_new_users'=>1})
  html = "\n\t<select name=\"settlement\" style=\"width:10em\">"
  html += "\n\t\t<option value=\"0\">None</option>"
  settlements.each_hash do
    |row|
    html += "\n\t\t<option value=\"#{row['id']}\""
    html += 'selected="yes" ' if $cgi['settlement'] == row['id']
    html += ">#{row['name']}, #{row['motto']}</option>"
  end
  html += "\n\t</select>"
end

Settlement_Box = settlement_box

puts <<ENDTEXT
<html>
<head profile="http://www.w3.org/2005/10/profile">
<link rel="icon" 
      type="image/png" 
      href="images/favicon.ico">
<title>Shintolin - Home</title>
<link rel=\"stylesheet\" type=\"text/css\" href=\"shintolin.css\"/>
</head>
<body>
<div class='bigbox' style='height:600px'>
<table>
<tr>
<td>
<img alt='Cave painting logo' src='images/cave_art.jpg' style='height:160px;display:inline' />
</td>

<td>
<h1>Shintolin</h1>
<h2>Explore. Settle. Trade. Conquer.</h2>
<p><i>A free <a href='http://github.com/IsaacLewis/Shintolin'>open-source</a> browser-based massively multiplayer game</i></p>
</td>

<td>
<img alt='Cave painting logo' src='images/bw_huts.jpg' style='height:160px;display:inline' />
</td>


<td>
<b>Shintolin is nearing the bandwidth limit for its webhost. Please contribute to the new server costs:</b>
<form action="https://www.paypal.com/cgi-bin/webscr" method="post">
<input type="hidden" name="cmd" value="_s-xclick">
<input type="hidden" name="hosted_button_id" value="8325424">
<input type="image" src="https://www.paypal.com/en_US/GB/i/btn/btn_donateCC_LG.gif" border="0" name="submit" alt="PayPal - The safer, easier way to pay online.">
<img alt="" border="0" src="https://www.paypal.com/en_GB/i/scr/pixel.gif" width="1" height="1">
</form>
<i>Donations are handled through Paypal, but you don't need a Paypal account to donate.</i><br/>
<i>For donations above £5, include a note with your character ID and the IP limit will be lifted for that character.</i><br/>
</td>

</tr>
</table>

<table>
<tr>

<td>

<div class='beigebox' style='width:15em'>

ENDTEXT

query = "SELECT COUNT(*) FROM `users` WHERE `active` = 1"
result = $mysql.query(query).fetch_hash
puts "<b>Active Users: #{result['COUNT(*)']}</b>"

puts "<br>"

query = "SELECT COUNT(*) FROM `settlements`"
result = $mysql.query(query).fetch_hash
puts "<b>Settlements: #{result['COUNT(*)']}</b>"

puts "<br>"

query = "SELECT COUNT(*) FROM `grid`"
result = $mysql.query(query).fetch_hash
puts "<b>Map: #{result['COUNT(*)']} squares</b>"

puts <<ENDTEXT
</div>


<div class='beigebox' style='width:15em;margin-top:4px'>\n
<b>Sign in:</b><hr/>
ENDTEXT

case $cgi['msg']
  when "bad_pw"
    puts "\t<b>Incorrect username or password</b>\n"
  when "account_made"
    puts "\t<b>Player #{$cgi['username']} created! You may now log in:</b>\n"
end

puts <<ENDTEXT
<form method='POST' action='game.cgi'>
Username: <br>
<input type='text' class='text' name='username' maxLength='24'><br>
Password: <br>
<input type='password' class='text' name='password' length='32'>
<hr>
<input type='submit' style='margin-left:auto;margin-right:0px' value='Login'>
</form>

</div>

<div class='beigebox' style='width:15em;margin-top:4px'>\n
<a class=\"buttonlink\" href=\"http://shintolin.forumcircle.com\">Forum</a>
<a class=\"buttonlink\" href=\"http://shintolin.wikia.com/wiki/Shintolin\">Help/Wiki</a>
<a class=\"buttonlink\" href=\"faq.html\">FAQ</a>
<p>
<a class=\"buttonlink\" href=\"rankings.cgi\">Rankings</a>
<a class=\"buttonlink\" href=\"isaac.html\">Creator</a>
</div>

</td>

<td>
<div class='beigebox' style='width:30em'>
<i>Humanity has wandered the world of Shintolin for millenia, hunting and gathering to survive. But some grow tired of the nomadic life, and are beginning to settle down. Forests make way for farmland, villages grow into towns and cities, and civilisations seek wealth, power, and glory.</i>

<hr>

<b>Hunt, or farm. Fight, or heal. Build, or conquer. Join hundreds of players in a free, browser-based world.</b>

<hr>

<div style='text-align:left;font-style:italic;'>
<ul>
<li>Work with other players to build a village, or try and survive the dangers of the wilderness</li>
<li>Find your fortune through farming, crafting, or trading</li>
<li>Explore a dynamic world, where every item, building and town is player-created</li>
<li>Shape the landscape, and write your own chapter in the history of Shintolin</li>
</ul>
</div>
</td>

<td>

<div class='beigebox' style='width:15em'>\n
<b>Create New Account:</b>
<hr>
ENDTEXT

case $cgi['msg']
  when 'too_long'
    puts "\t<b>Username or password too long</b>\n"
  when 'too_short'
    puts "\t<b>Username or password too short</b>\n"
  when 'name_taken'
    puts "\t<b>Username is already taken</b>\n"
  when 'pw_not_match'
    puts "\t<b>Passwords do not match</b>\n"
end

if $cgi['msg'] != 'account_made'
  puts <<ENDTEXT
    <form method='POST' action='signup.cgi'>
    Username: <br>
    <input type='text' class='text' name='username' maxLength='24'><br>
    E-mail: <br>
    <input type='text' class='text' name='email' length='100'><br>
    Password: <br>
    <input type='password' class='text' name='password_1' length='20'><br>
    Re-enter password: <br>
    <input type='password' class='text' name='password_2' length='20'><br>
    Settlement (optional, and can be changed later): <br>
    #{Settlement_Box}
    <hr>
    <input type='submit' value='Sign Up Now!' />
    </form>
ENDTEXT

else
  puts "\t<b>Player #{$cgi['username']} created! You may now log in.</b>\n"
end

puts <<ENDTEXT
</div>

</td>

</tr>
</table>
</div>
<br>

<div class='news'>
<h3>Updates</h3>
<h4>23rd January</h4>
<p><b>Damaging buildings</b> was made more difficult.</p>

<p>Shintolin was moved to a <b>new server</b>.</p>

<p>Shintolin is now <a href='http://github.com/IsaacLewis/Shintolin'><b>open source</b></a>! 

<h4>9th December</h4>
<p>A serious <b>bug</b> (where users would see nothing but a white screen) was <b>fixed</b>.</p>

<p>Players cannot <b>take items from stockpiles</b> within a village they do not inhabit. This is an experiment with stockpile locking, and may not be a permanent feature.</p>

<h4>17th November</h4>
<p><b>Hospitals</b> now provide a bonus when using and crafting healing items.</p>

<h4>11th November</h4>
<p>The <b>chat box</b> was moved to a seperate page.</p>

<h4>31st October</h4>
<p>A number of bugs were fixed, namely:</p>
<li>Small buildings can now be constructed on dirt and forest tiles.</li>
<li>Filling pots now costs AP, rather than giving it.</li>
<li>Pots are not used up when baking bread, but are used up when making pots of flour.</li>
</ul>

<p><b>Absolutely nothing</b> else was changed today.</p>

<h4>7th October</h4>
<p>The <b>IP limit</b> was removed for donating players.</p> 

<h4>2nd October</h4>
<p>Shintolin is now accepting <b>donations</b>.</p>

<h4>1st October</h4>
<p>A new <b>healing item</b> was added.</p>

<h4>20th September 2009</h4>
<p>Some <b>new skills</b> were added.</p>

<h4>19th September 2009</h4>
<p>The <b>IP limit</b> has been reinstated for version 2; as before, a maximum of 330 hits are permitted from one IP address per day. Note that only hits to the game.cgi script are counted. For example, buying skills or looking at profiles do not count towards your IP limit, but refreshing the page or chatting do.</p>

<h4>18th September 2009</h4>
<p>Town leaders can now choose whether or not to <b>allow newly-created characters</b> to join their settlement. </p>

<h4>15th September 2009</h4>
<p>The <b>interface</b> was decluttered slightly, by strategically hiding certain commands. For example, the option to attack will not appear if there is nothing for you to attack.</p>

<p>The <b>level cap</b> was increased to 17.</p>

<p>Players at max ap, who have not logged in for over 24 hours, will not <b>lose hunger</b>. This is to reduce difficulty for those who do not log in every day.</p>

<h4>14th September 2009</h4>
<p>Stones can be <b>quarried</b>, and players with the masonry skill can now build <b>stone buildings.</b></p>

<p>Buildings are now damaged by periodic <b>storms</b>.</p>

<p><b>Settlement destruction</b> was re-implemented for version 2.</p>

<h4>13th September 2009</h4>
<p>Damaged buildings can now be <b>repaired</b>.</p>

<h4>12th September 2009</h4>
<p>The <b>map screen</b> was re-added.</p>

<p>Players <b>without the foraging skill</b> can no longer see the resource level when searching squares (this was an oversight in the new version).</p>

<h4>11th September 2009</h4>
<p>Names of <b>players from the same settlement</b> now appear in green.</p>

<h4>10th September 2009</h4>
<p>A <b>chat box</b> was added.</p>

<p><b>Dropped items</b> no longer disappear - although they do not appear on the map, they may be found by searching in the tile where they were dropped. Items dropped on a tile containing a stockpile are added to the stockpile.</p>

<p>Kids these days don't now what it was like to wander the wilderness, they didn't have none of this "civilisation" when I were a lad. <b>New players</b> may choose to start in an existing settlement.</p>

<h4>9th September 2009</h4>
<p>Huts can now be converted into <b>shrines</b>, by players with the appropriate skill. (Note: shrines currently have no effect, their purpose being the challenge of building them).</p>

<p>Food will now <b>rot</b>.</p>

<h4>8th September 2009</h4>
<p>Some new <b>animal types</b> (based on player suggestions) were added.</p>

<p>Players at 0 hunger will automatically <b>eat</b>, if they have any food.</p>

<p><b>Construction tools</b> are now breakabke.</p>

<p>When you mouse over the names of players (in the area description box) or settlements, you can read the first few lines of their <b>profile</b>, if set.</p>

<h4>5th September 2009</h4>
<p>Shintolin 2.0 has been launched. New features include a redesigned interface, new animal types, more complex animal behaviour, '/me' commands in messages, the ability to sell skills, plus a number of small tweaks. In addition, several bugs have been fixed.</p>

<p>Check the <a href=\"http://shintolin.forumcircle.com\">forum</a> for the chance to suggest a new animal to be added to the game.</p>
<hr>

<h4>12th July 2009</h4>
<p>New <b>areas</b> and <b>terrain types</b> have been added to the map.</p>
<h4>8th July 2009</h4>
<p>Animals will now <b>spawn</b> in different regions and habitats (depending on species). Players in the <b>wilderness</b> are now visible on the map.</p>
<h4>8th May 2009</h4>
<p><b>Hares</b> can now be seen roaming the meadows of Shintolin, and <b>deers</b> will now leave the forests.</p>
<p>Players with the carpentry skill can now build <b>signposts</b>.</p>
<h4>3rd May 2009</h4>
<p>The <b>interface</b> was tweaked, hopefully preventing a bug where certain elements were overlapping.</p>
<h4>30th April 2009</h4>
<p>Players with the <b>Triage</b> skill can now view the health level of other characters. <b>Dirt tracks</b> can now be built on tiles that already contain a building.</p>
<h4>19th April 2009</h4>
<p>The <b>trade</b> system was overhauled; seperate prices can be set for buying and selling. In addition, information about which players have trade prices set is visible from the main screen.</p>
<h4>18th April 2009</h4>
<p>Based on player feedback, the <b>interface</b> was rearranged slightly. Leaders can now <b>edit information</b> about their settlements. Buildings can be <b>written</b> on.</p>
<h4>17th April 2009</h4>
<p>Settlements now have <b>leaders</b>, which are selected from whomever has the most support from other inhabitants.</p>
<p>Players can now <b>write</b> on buildings.</p>
<h4>16th April 2009</h4>
<p><b>Settlements</b> now have profile pages, and appear on the rankings screen. Players can <b>join settlements</b>.</p>
<h4>15th April 2009</h4>
<p>To prevent people registering more than 3 characters, a 330-hit <b>IP limit</b> is now in place.</p>
<p>Settlements can now be <b>destroyed</b>.</p>
<h4>11th April 2009</h4>
<p>A new <b>highlands</b> region was added to the map. The first village to settle there gets to choose a name for it, of the format \"(The) Something Hills\".</p>
<h4>10th April 2009</h4>
<p><b>Images</b> can now be included on player profiles. Actions such as <b>adding fuel</b> to campfires and <b>chopping down trees</b> are now recorded.</p>
<p>Multiple heights of <b>hills</b> were added, and AP costs for climbing hills were changed to be more logical (it costs more AP to climb a hill, than to move around once up there). <b>Impassable</b> terrain types were added.</p> 
<h4>7th April 2009</h4>
<p>A wandering tribe has settled by a large body of water, which they have named <b>Hermit Lake</b>. There seems to be a different distribution of <b>plant life</b> in that region; some items are more common, some are less so.</p>
<p>To allow villages more control over their resources, players that enter a square containing a <b>stockpile</b> can see all items that were added and removed within the past 24 hours. <b>Buildings</b> can now only hold a limited number of users.</p> 
<h4>6th April 2009</h4>
<p>Shintoli astronomers are reporting that the pace of life has changed; the <b>years</b> now pass a rate of one every twelve real life days.</p>
<p><b>Inactive players</b> now dissapear from the map after 5 days. Their accounts are not deleted and their characters reappear when they log back in.<p>
<p>In response to player feedback, players' actions are less limited when <b>dazed</b>; they can now search, give items, trade, and use non-revive items. To balance this, they now regain AP at a much slower rate until they are revived.</p>
<p><b>New players</b> begin the game with three days' worth of food - however, they can only eat it while they remain at level one.</p>
<h4>4th April 2009</h4>
<p>Stone spears can now be used as a <b>ranged weapon</b>, by players with the appropriate skill.</p>
<h4>3rd April 2009</h4>
<p>User <b>profiles</b> are now viewable. Achievement-minded players can now compare their <b>ranking</b> in various attributes.</p>
<h4>2nd April 2009</h4>
<p><b>Farming</b> has been implemented. Iis has arrived at Eudaimonia's totem pole, bringing supplies of <b>wheat</b> to trade.</p>
<p>Crop cycles are effected by <b>seasons</b>, as are search rates and location descriptions. Currently, one season is equal to one real world day - this is temporary, to iron out any bugs in the system. It will increase to one season every three or four days at some stage.</p>
<h4>1st April 2009</h4>
<p>Player can now <b>view a map</b> of the area beyond the their immediate surroundings. Users are now capped at <b>level 15</b>, at which point they can continue to earn XP but not buy new skills. This cap will likely rise as the number of skills rises.</p>
<h4>31st March 2009</h4>
<p>Longhouses can now be converted into <b>workshops</b>, which allow certain items to be crafted for a lower AP cost, or <b>hospitals</b>, where healing items are more effective. However, doing this removes the AP restoration benefits of the longhouse.</p>
<p>Players now cook the pieces of <b>raw meat</b> in their inventory all at once, rather than one by one. The AP cost is fixed, regardless of how much meat is cooked.</p>
<h4>29th March 2009</h4>
<p>Players can now <b>trade</b> items - try visiting Iis at the starting square to see what he has in stock. Players can also <b>offer</b> items to anyone who revives them whilst dazed.</p>
<h4>27th March 2009</h4>
<p><b>Buildings</b> can now be attacked and destroyed, and weapons are <b>breakable</b>.</p>
<h4>26th March 2009</h4>
<p>The <b>map</b> was tweaked slightly, hopefully fixing a bug where tiles would display incorrectly.</p>
<h4>25th March 2009</h4>
<p><b>New players</b> now begin in a random location. Gaining <b>new skills</b> only increases the XP cost for skills of the same type.</p>
<p><b>Longhouses</b> are a new, settlement-only building; they require multiple stages to be built.</p>
<h4>24th March 2009</h4>
<p>Players with the <b>Settling</b> skill can now <b>found settlements</b>.</p>
<p>A number of <b>new skills</b> were added. Meat must now be <b>cooked</b> before eating. The <b>hunger</b> system is more forgiving; players have more hunger points, and lose health more slowly when starving.</p>
<h4>23rd March 2009</h4>
<p>Animals now keep to the forests, and some will <b>retaliate</b> if attacked. <b>Campfires</b> burn more slowly, and their fuel levels can be seen.</p>
<p>The XP cost of <b>new skills</b> increases as one levels up. <b>Chopping down trees</b> now gives Wanderer XP; the AP cost can be reduced by purchasing the <b>Lumberjack</b> skill.</p>
<h4>22nd March 2009</h4>
<p><b>Animals</b> can now be attacked. <b>Action Points</b> are now capped at 120, and recover at a faster rate (4 per hour, compared to 3 previously). <b>New areas</b> have been added to the map.</p>
<h4>21st March 2009</h4>
<p><b>Wanderer XP</b> can now be gained by searching or travelling through forest and hill squares, and spent on the <b>forager</b> skill, which allows players to see the resource level of a square.</p>
<p><b>Deer</b> have been spotted roaming the woods of Shintolin.</b> 
<h4>20th March 2009</h4>
<p>Items can now be added to and taken from <b>stockpiles</b>. <b>Forests</b> can be chopped down, and automatically regrow after a set period of time. Dirt also eventually reverts to meadow, and search rates in over-gathered squares slowly recover.</p>
<h4>19th March 2009</h4>
<p><b>Searching</b> in one location too many times results in that location turning to <b>dirt</b>. The <a href='http://shintolin.wikia.com/wiki/Shintolin'><b>wiki</b></a> has been created.</p>
<p>Players can now <b>give</b> items to one another. <b>Fields</b> can be dug. Campfires now <b>go out</b> if they run out of fuel.</p>
<h4>18th March 2009</h4>
<p>Players can now <b>enter</b> buildings; <b>resting</b> in a hut or by a campfire gives a boost to AP recovery rates. Different thicknesses of <b>forest</b> now exist. The <b>interface</b> was also given a bit of a makeover.</p>
<p>The Shintolin <b>IRC channel</b> has been set up. You can join it with an IRC client at irc://irc.efnet.org/shintolin or by joining an EFNet server (/server irc.efnet.org) and joining #Shintolin (/join #Shintolin).</p>
<h4>17th March 2009</h4>
<p>Players can now <b>build huts</b> and <b>campfires</b>. Certain actions give <b>XP</b>, which can be used to <b>buy skills</b>.</p>
<p>The game can be discussed on the <a href='http://shintolin.forumcircle.com'><b>forum</b></a>.
<h4>16th March 2009</h4>
<p>Players can now craft <b>stone spears</b> and <b>axes</b>. Actions are now limited by the <b>AP System</b>. <b>Apples</b> and <b>wild onions</b> can now be found, which is useful, as players now lose health if their <b>hunger</b> levels drop below zero.</p>
<p>As of today, players can <b>move</b>, <b>search</b> for and <b>drop</b> items, <b>use</b> items on each other, <b>craft</b> items, <b>attack</b> each other, <b>talk</b>, and receive <b>messages</b> about in-game events.</p>
<p>A number of new people have appeared in the world, believing themselves to have come from a mythical island named 'Shartak'. A player named <b>kenny</b> briefly declared himself King after temporarily wiping out everyone else.</p>
<p></div>
</body>
</html>
ENDTEXT
