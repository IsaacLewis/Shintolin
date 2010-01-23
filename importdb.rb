load 'mysql.rb'
load 'functions.rb'
$mysql_debug = true

$old_db = mysql_connect('shintolin')
$new_db = mysql_connect('shintoby')

class String
  def cap_words
    array = self.split(' ')
    array.map {|x| x.capitalize}
    array.map! {|x| x.capitalize}
    array.join(' ')
  end
end

def load_inventories
  items = db_table(:item).values
  old_invs = $old_db.query('SELECT * FROM inventories')
  old_invs.each_hash{
    |inv|
    print "ID: #{inv['ID']}" 
    items.each {
      |item|
      amount = inv[item[:plural]]
      if amount.to_i != 0
        print "\t" + item[:plural] + " " + amount + "\n"
        insert_hash = {'user_id'=>inv['ID'],'item_id'=>item[:id],'amount'=>amount}
        mysql_insert('inventories',insert_hash)
      end
    }
    print "\n"
  }
  'Done'
end

def load_stockpiles
  items = db_table(:item).values
  old_stocks = $old_db.query('SELECT * FROM stockpiles')
  old_stocks.each_hash{
    |stock|
    print "X, Y: #{stock['X']}, #{stock['Y']}" 
    items.each {
      |item|
      amount = stock[item[:plural]]
      if amount.to_i != 0
        print "\t" + item[:plural] + " " + amount + "\n"
        insert_hash = {'x'=>stock['X'],'y'=>stock['Y'],'item_id'=>item[:id],'amount'=>amount}
        mysql_insert('stockpiles',insert_hash)
      end
    }
    print "\n"
  }
  'Done'
end

def load_grid
  buildings = db_table(:building).values
  regions = db_table(:region).values
  old_map = $old_db.query("SELECT * FROM grid")
  old_map.each_hash{
    |tile|
    if tile['building'] != nil
      bid = row_where(:building, :name, tile['building'])[:id]
      # print "Building: #{tile['building']}, id: #{bid}"
    else
      bid = 0
    end
    if tile['region'] != nil && tile['region'] != ''
      print "Region: #{tile['region']}," 
      rid = row_where(:region, :name, tile['region'].cap_words)[:id]
      puts " id: #{rid}"
    else
      rid = 0
    end
    update_hash = 
    {'x'=>tile['X'], 'y'=>tile['Y'],'building_id'=>bid,'region_id'=>rid,
    'hp'=>tile['hp'], 'building_hp'=>tile['bhp'], 'terrain'=>tile['terrain']}
    mysql_insert('grid',update_hash)
  }
  'Done'
end

def load_skills
  skills = db_table(:skill).values
  old_skills = $old_db.query('SELECT * FROM skills')
  old_skills.each_hash{
    |row|
    puts "Player ID: #{row['ID']}"
    skills.each{
      |skill|
      name = skill[:name]
      puts "\t#{name}: #{row[name]}"
      mysql_insert('skills',{'user_id'=>row['ID'],'skill_id'=>skill[:id]}) if row[name] == "1"
    }
  }
end

def load_messages
  old_msgs = $old_db.query('SELECT * FROM messages')
  old_msgs.each_hash{
    |row|
    # puts "Speaker: #{row['speaker']} Target: #{row['target']}"
    s = mysql_row('users',{'name'=>row['speaker']})
    s_id, t_id = 0,0
    s_id = s['id'] if s != nil
    t = mysql_row('users',{'name'=>row['target']}) if row['target'] != nil
    t_id = t['id'] if t != nil
    mysql_insert('messages',{'id'=>row['ID'],'message'=>row['message'],'speaker_id'=>s_id,'target_id'=>t_id,'x'=>row['x'],'y'=>row['y'],'z'=>0,'type'=>row['type'],'time'=>row['time']})
  }
end

def load_animals
  old_animals = $old_db.query('SELECT * FROM animals')
  old_animals.each_hash {
    |row|
    type_id = row_where(:animal, :name, row['type'])[:id]
    puts "Animal: #{row['type']} ID: #{type_id}"
    mysql_insert('animals',{'id'=>row['ID'],'x'=>row['X'],'y'=>row['Y'],'hp'=>row['hp'],'type_id'=>type_id})
  }
end

def load_towns

  towns = $old_db.query('SELECT * FROM `settlements`')
  towns.each_hash {|row|
    desc = insert_breaks(row['description'])
    leader_id = mysql_row('users',
      {'name'=>row['leader']})['id']
    mysql_insert('settlements',  
      {'name'=>row['name'], 'founded'=>row['founded'], 'title'=>row['title'], 'x'=>row['X'], 'y'=>row['Y'], 'motto'=>row['motto'], 'id'=>row['ID'], 'type'=>row['type'], 'website'=>'', 'description'=>desc, 'image'=>row['image'], 'leader_id'=>leader_id})  
  }
end

def load_accounts

  accounts = $old_db.query('SELECT * FROM `accounts`')
  accounts.each_hash {
    |row|
    settlement_id = 0
    if row['settlement'] != ''
      settlement = mysql_row('settlements',
        {'name'=>row['settlement']})
      settlement_id = settlement['id'] if settlement != nil
    end

    desc = insert_breaks(row['description'])
    mysql_insert('accounts', 
      {'deaths'=>row['deaths'], 'vote'=>row['vote'], 'kills'=>row['kills'], 'lastrevive'=>row['lastrevive'], 'joined'=>row['joined'], 'frags'=>row['frags'], 'points'=>row['points'], 'id'=>row['ID'], 'website'=>'', 'settlement_id'=>settlement_id, 'description'=>desc, 'image'=>row['image'], 'revives'=>row['revives'], 'email'=>row['email']})
  }
end
# {"deaths"=>"4", "vote"=>"0", "kills"=>"7", "lastrevive"=>"2009-04-03", "joined"=>"2009-03-16", "username"=>"Isaac", "frags"=>"2", "points"=>"0", "ID"=>"1", "description"=>"In a grey cloak and floppy, broad-brimmed hat, he looks otherwise unremarkable except for a patch over his left eye.\r\n\r\nHello!", "settlement"=>"", "image"=>"http://www.thewhitewillow.com/gallery/odinimages/odin.jpg", "password"=>"92dd97fc0bad4205c6c3aaee79690f7e", "revives"=>"10", "email"=>"", "active"=>"1"}
