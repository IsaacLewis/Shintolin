load 'functions.rb'
require 'test/unit'
class Tests < Test::Unit::TestCase

  def setup
    # this method gets called before each test
    mysql_update('users',1,
      {'x'=>-98, 'y'=>-98,'z'=>0,'hp'=>50,'ap'=>100,'active'=>1,'hunger'=>6})
    mysql_update('users',47,
      {'x'=>-98, 'y'=>-98,'ap'=>100,'hp'=>33,'active'=>1,'hunger'=>6})
    mysql_delete('animals',1)
    mysql_insert('animals',{'id'=>1})
    mysql_update('animals', 1, {'x'=>-98, 'y'=>-98, 'hp'=>50, 'type_id'=>6})
    mysql_update('grid',{'x'=>-98, 'y'=>-98},
      {'building_id'=>0, 'terrain'=>1})
    mysql_update('grid',{'x'=>-97, 'y'=>-98},
      {'building_id'=>0, 'terrain'=>41})
    mysql_delete('skills',{'user_id'=>47})
    @isaac = User.new(1)
    @allt = User.new(47)
    @hare = Animal.new(1)
    @valhalla = Settlement.new(22)

    items = db_table(:item).keys
    items.each {|item| mysql_change_inv(@isaac, item, -1000)}

    mysql_change_inv(@isaac, :test_weapon, -100)
    mysql_change_inv(@isaac, :test_weapon, 1)
    mysql_change_inv(@isaac, :test_weapon2, -100)
    mysql_change_inv(@isaac, :test_weapon2, 1)
  end

  def test_move
    assert_nothing_raised {@msg = move(1, -1, -1, 0)}
  end

  def test_describe_location
    @isaac = User.new 1
    assert_nothing_raised {describe_location(1)}
    assert_nothing_raised {html_forms(@isaac)}
    assert_nothing_raised {html_location_box(@isaac)}
    assert_nothing_raised {html_map(@isaac.tile, 5, @isaac)}
  end

  def test_attack_totem
    mysql_update('users',1,{'x'=>@valhalla.x,'y'=>@valhalla.y})
    @isaac = User.new 1
    @totem = @isaac.tile.building
    assert_nothing_raised {@msg = attack(@isaac, @totem, 25)}
    puts @msg
  end

  def test_attack_user
    hp = @allt.hp
    @last_message_id = mysql_max_id('messages')
    assert_nothing_raised {@msg = attack(@isaac, @allt, 25)}

    
    @allt = User.new 47
    assert_equal(hp - 10, @allt.hp)

    msg_re = /.* cudgeled .* with a .* for [\d]+ hp damage.*/
    assert(@msg =~ msg_re)
    @db_msg = mysql_row('messages', @last_message_id + 1)['message']
    assert(@db_msg =~ msg_re)    
  end

  def test_attack_miss
    hp = @allt.hp
    assert_nothing_raised {@msg = attack(@isaac, @allt, 27)}
    msg_re = 
    /<b>You<\/b> lunged at (you){0,0}.* with .*, but missed!.*/
    assert(@msg =~ msg_re)
    @allt = User.new 47
    assert_equal(hp, @allt.hp)    
  end

  def test_attack_animal
    hp = @hare.hp
    assert_nothing_raised {attack(@isaac, @hare, 25)}
    @hare = Animal.new 1
    assert_equal(hp - 10, @hare.hp)     
  end

  def test_attack_animal_kill
    mysql_update('animals',1,{'hp'=>1})
    assert_nothing_raised {attack(@isaac, @hare, 25)}
    @hare = Animal.new 1
    assert(!@hare.exists?)
    assert_equal(1, user_item_amount(@isaac, :pelt))
  end

  def test_has_items?
    assert(!user_has_item?(@isaac, :stick))
    assert(!user_has_item?(@isaac, [:stick]))
    assert(!user_has_item?(@isaac, {:stick => 1}))
  end
 
  def test_build_tools
    mysql_change_inv(@isaac, :timber, 10)
    can_build, msg = can_build?(@isaac, :longhouse1)
    assert(!can_build)
    assert_equal(msg, "You need a set of stone carpentry tools to " +
      "build a longhouse (1/2).")

    mysql_change_inv(@isaac, :timber, -10)
  end

  def test_build_materials
    hut = db_row(:building, :hut)
    can_build, msg = can_build?(@isaac, hut)
    assert(!can_build)
    assert(msg =~ /You need .* to build a hut./)
  end

  def test_build
    mysql_change_inv(@isaac, :stick, 20)
    mysql_change_inv(@isaac, :staff, 5)
    assert_nothing_raised {build(@isaac, 1)}
    assert_equal(@isaac.tile.building_id, 1)
  end

  def test_craft_building
    mysql_change_inv(@isaac, :stick, 1)
    craft_msg = craft(@isaac, 14)
    assert_equal(craft_msg, "You must be in the vicinity of " +
      "a campfire to craft a digging stick.")
    mysql_change_inv(@isaac, :stick, -1)
  end

  def test_craft
    mysql_change_inv(@isaac, :thyme, 5)
    mysql_change_inv(@isaac, :bark, 2)
    assert_nothing_raised {craft(@isaac, 5)}
    assert_equal(user_item_amount(@isaac, :poultice), 1)
  end

  def test_describe_message
    msg = 
    mysql_select('messages',{'speaker_id'=>1},{'type'=>'distant'}).fetch_hash
    msg_re = /<a href=.*>Isaac<\/a>/
    assert(describe_message(msg) =~ msg_re)
    msg_re = /<b>You<\/b> .*/
    assert(describe_message(msg, 1) =~ msg_re)
  end

  def test_mysql_max_id
    assert_nothing_raised {mysql_max_id('animals')}
    assert_equal(Fixnum, mysql_max_id('animals').class)
  end

  def test_write
    mysql_update('grid',{'x'=>-98,'y'=>-98},{'building_id'=>5})
    assert_nothing_raised {@msg = write(@isaac, "hiso!")}
    assert_equal("You cannot write on a campfire.", @msg)
  end

  def test_mysql_change_stat
    points = @isaac.points
    assert_nothing_raised {mysql_change_stat(@isaac, 'points', +1)}
    @isaac = User.new 1
    assert_equal(points + 1, @isaac.points)
    assert_nothing_raised {mysql_change_stat(@isaac, 'points', -1)}
    @isaac = User.new 1
    assert_equal(points, @isaac.points)    
  end

  def test_revive
    mysql_update('users',47,{'hp'=>0})
    mysql_change_inv(@isaac, :poultice, 1)
    revives = @isaac.revives
    assert_nothing_raised {revive(1, 47, 5)}
    @isaac = User.new 1
    assert_equal(revives + 1, @isaac.revives)
    mysql_change_stat(@isaac, 'revives', -1)
  end

  def test_over_encumberance
    mysql_change_inv(@isaac, :log, 100)
    assert_nothing_raised {@msg = move(1, 1, 0, 0)}
    assert_equal('You are over-encumbered and cannot move.', @msg)
    @new_isaac = User.new(1)
    assert(same_location?(@isaac, @new_isaac))
  end

  def test_population
    mysql_update('accounts',1,{'settlement_id'=>0})
    warwick_pop = Settlement.new(20).population
    mysql_update('accounts',1,{'settlement_id'=>20})
    assert_equal(warwick_pop + 1, Settlement.new(20).population)
  end

  def test_noobcake
    mysql_change_inv(@isaac, :noobcake, 5)
    allt_hunger = @allt.hunger
    assert_nothing_raised {@msg = use(@isaac, @allt, 23)}
    assert(/.*feed a noobcake.*allthatyousee.*/ =~ @msg) 
    @allt = User.new 47
    assert_equal(allt_hunger + 1, @allt.hunger)

    isaac_hunger = @isaac.hunger
    assert_nothing_raised {@msg = use(@isaac, @isaac, 23)}
    assert(/.*noobcake.*Try finding a different.*/ =~ @msg)
    @isaac = User.new 1
    assert_equal(isaac_hunger, @isaac.hunger)
  end

  def test_quarry
    mysql_update('grid',@isaac.tile.mysql_id,{'terrain'=>110})
    assert_nothing_raised {quarry(@isaac)}
    assert_equal(0, user_item_amount(@isaac, :boulder))

    mysql_change_inv(@isaac, :bone_pick, 1)
    assert_nothing_raised {quarry(@isaac)}
  end

  def test_drop
    assert_nothing_raised {drop(@isaac, :test_weapon, 1)}
    assert_equal(0, user_item_amount(@isaac, :test_weapon))
  end

  def test_join
    mysql_update('users',1,{'x'=>@valhalla.x, 'y'=>@valhalla.y})
    mysql_update('accounts',1,{'settlement_id'=>0})
    assert_nothing_raised {@msg = join(@isaac)}
    assert(/.*pledge allegiance to Valhalla.*/ =~ @msg)
    @isaac = User.new 1
    assert_equal('Valhalla',@isaac.settlement.name)
    assert_nothing_raised {@msg = join(@isaac)}
    assert(/.*already a resident of Valhalla.*/ =~ @msg)
  end

  def test_leave
    mysql_update('accounts',1,{'settlement_id'=>20})
    assert_nothing_raised {@msg = leave(@isaac)}
    assert(/.*are no longer a resident of Valhalla.*/ =~ @msg)
    @isaac = User.new 1
    assert_equal(0,@isaac.settlement_id)
    assert_nothing_raised {@msg = leave(@isaac)}
    assert(/.*are not currently a member of any.*/ =~ @msg)
  end

end