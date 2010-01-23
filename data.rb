$Data =
  {
  :animal =>
  {
    :deer => 
    {:id => 1,
      :name => "deer",
      :plural => "deer",
      :habitats => [:forest,:open],
      :max_hp => 30,
      :when_attacked => {:flee => 60},
      :loot => {:raw_meat => 8, :pelt => 1}
    },
    
    :boar =>
    {:id => 2,
      :name => "wild boar",
      :plural => "wild boars",
      :habitats => [:forest],
      :max_hp => 20,
      :attack_dmg => 2,
      :hit_msg => "gores you with its tusk",
      :when_attacked => {:flee => 25, :attack => 25},
      :loot => {:raw_meat => 3, :pelt => 1}
    },
    
    :wolf =>
    {:id => 3,
      :name => "wolf",
      :plural => "wolves",
      :habitats => [:forest,:open],
      :attack_dmg => 3,
      :max_hp => 50,
      :when_attacked => {:attack => 45},
      :hit_msg => "sinks it's teeth into your thigh",
      :loot => {:raw_meat => 6, :wolf_pelt => 1}
    },
    
    :hare =>
    {:id => 4,
      :name => "hare",
      :plural => "hares",
      :habitats => [:open],
      :max_hp => 10,
      :attack_dmg => 1,
      :hit_msg => "kicks you",
      :when_attacked => {:flee => 80, :attack => 10},
      :loot => {:raw_meat => 2, :small_pelt => 1}
    },
    
    :mountain_lion =>
    {:id => 5,
      :name => "mountain lion",
      :plural => "mountain lions",
      :habitats => [:open, :hills],
      :attack_dmg => 3,
      :max_hp => 70,
      :when_attacked => {:attack => 45},
      :hit_msg => "sinks it's teeth into your thigh",
      :loot => {:raw_meat => 8, :lion_pelt => 1}
    },
    
    :sabre_tooth =>
    {:id => 6,
      :name => "sabre-tooth tiger",
      :plural => "sabre-tooth tigers",
      :habitats => [:open],
      :attack_dmg => 5,
      :max_hp => 100,
      :when_attacked => {:attack => 45},
      :hit_msg => "sinks it's teeth into your thigh",
      :loot => {:raw_meat => 10, :pelt => 1, :sabre_tooth => 2}
    },
    
    :bear =>
    {:id => 7,
      :name => "bear",
      :plural => "bears",
      :habitats => [:forest],
      :attack_dmg => 3,
      :max_hp => 200,
      :when_attacked => {:attack => 30, :flee => 8},
      :hit_msg => "sinks it's teeth into your thigh",
      :loot => {:raw_meat => 20, :bear_skin => 1}
    },
    
    :squirrel =>
    {:id => 8,
      :name => "squirrel",
      :plural => "squirrel",
      :habitats => [:forest],
      :attack_dmg => 1,
      :max_hp => 6,
      :when_attacked => {:attack => 10, :flee => 80},
      :hit_msg => "nips you on the pinky",
      :loot => {:raw_meat => 1, :small_pelt => 1}
    },
    
    :croc =>
    {:id => 9,
      :name => "crocodile",
      :plural => "crocodiles",
      :habitats => [:wetland, :shallow_water, :beach],
      :max_hp => 100,
      :attack_dmg => 5,
      :hit_msg => "bites you",
      :when_attacked => {:flee => 10, :attack => 40},
      :loot => {:croc_skin => 1, :raw_meat => 7}
    },
    
    :goose =>
    {:id => 10,
      :name => "goose",
      :plural => "geese",
      :habitats => [:shallow_water, :deep_water, :beach, :wetland],
      :max_hp => 15,
      :when_attacked => {:flee => 60},
      :loot => {:raw_meat => 3}
    },
    
    :buffalo =>
    {:id => 11,
      :name => "buffalo",
      :plural => "buffalo",
      :habitats => [:open],
      :max_hp => 100,
      :attack_dmg => 4,
      :hit_msg => "tramples you with its hooves",
      :when_attacked => {:flee => 15, :attack => 40},
      :loot => {:raw_meat => 20, :pelt => 1, :horn => 2}
    },
    
    :pheasant =>
    {:id => 12,
      :name => "pheasant",
      :plural => "pheasants",
      :habitats => [:forest],
      :max_hp => 10,
      :when_attacked => {:flee => 60},
      :loot => {:raw_meat => 3}
    },
    
    :stag => 
    {:id => 13,
      :name => "stag",
      :plural => "stags",
      :habitats => [:forest,:open],
      :max_hp => 45,
      :when_attacked => {:flee => 60},
      :loot => {:raw_meat => 10, :pelt => 1, :antler => 2}
    },
    
    :beehive =>
    {:id => 14,
      :name => "beehive",
      :plural => "beehive",
      :habitats => [:forest],
      :immobile => :true,
      :max_hp => 20,
      :attack_dmg => 1,
      :hit_msg => "is surrounded by a swarm of angry bees, which sting you",
      :when_attacked => {:attack => 80},
      :loot => {:honeycomb => 3}
    },
    
  },
  
  :building =>
  {  
    :hut =>
    {:id => 1,
      :name => 'hut',
      :size => :small,
      :floors => 1,
      :max_hp => 30,
      :ap_recovery => +0.5,
      :build_ap => 40,
      :build_xp => 25,
      :build_skill => :construction,
      :materials => {:stick => 20, :staff => 5},
      
      :interior => "You are inside a crude hut. " +
      "Shafts of sunlight break through the wooden staves",
      :build_msg =>  "Planting the tall staves in the ground, you weave in the sticks to build a crude wooden hut."
    },
    
    :longhouse1 => 
    {:id => 21,
      :name => 'longhouse (1/2)',
      :size => :large,
      :floors => 0,
      :tools => [:stone_carpentry],
      :materials => {:timber => 12},
      :max_hp => 30,
      :settlement_level => :village,
      :build_skill => :construction,
      :build_ap => 50,
      :build_xp => 35,
      :build_msg => "You dig trenches for a foundation, then set to work building the walls of the longhouse. It isn't finished yet: you still need to build the roof."
    },
    
    :longhouse2 => 
    {:id => 2,
      :name => 'longhouse',
      :size => :large,
      :floors => 1,
      :tools => [:stone_carpentry],
      :ap_recovery => +1,
      :build_ap => 50,
      :build_xp => 35,
      :max_hp => 50,
      :settlement_level => :village,
      :prereq => :longhouse1,
      :build_skill => :construction,
      :materials => {:timber => 12},
      
      :interior => "You are inside a large wooden longhouse. " +
      "Pelts are strewn across the packed earth floor. " +
      "They look comfortable enough to sleep on",
      :build_msg => "You build the roof, and the longhouse is complete."
    },
    
    :stockpile =>
    {:id => 3,
      :name => 'stockpile',
      :size => :small,
      :floors => 0,
      :actions => [:take, :give],
      :max_hp => 10,
      :build_ap => 10,
      :build_xp => 3,
      :materials => {:stone => 8},
      :build_msg => "You stake out a stockpile on the ground."
    },
    
    :totem =>
    {:id => 4,
      :name => "totem pole",
      :special => :settlement,
      :size => :small,
      :floors => 0,
      :actions => [:join],
      :unwritable => true,
      
      :build_ap => 30,
      :build_xp => 0,
      :max_hp => 30,
      :materials => {:log => 1},
      :build_skill => :settling
    },
    
    :campfire =>
    {:id => 5,
      :name => 'campfire',
      :size => :small,
      :floors => 0,
      :actions => [:add_fuel],
      :unwritable => true,
      :ap_recovery => +0.3,
      :max_hp => 30,
      :build_hp => 10,
      :build_ap => 10,
      :build_xp_type => :wander,
      :build_xp => 5,
      :materials => {:stick => 10},
      :build_msg => "You rub two sticks together, gradually heating them up. Eventually you produce a few embers, and soon there is a roaring fire in front of you.",
    },
    
    :workshop =>
    {:id => 6,
      :name => 'workshop',
      :size => :large,
      :floors => 1,
      :build_skill => :artisanship,
      :build_ap => 25,
      :build_xp => 25,
      :max_hp => 50,
      :prereq => :longhouse2,
      :settlement_level => :village,
      :materials => {:timber => 6, :stone_carpentry => 4},
      
      :build_msg => "You assemble work benches and organise your tools, setting up a workshop in this building.",
      :interior => "You are inside a large wooden building. " +
      "Workbenches and carpentry tools are scattered around, " +
      "and scraps of timber are piled up in the corner"
    },
    
    :hospital =>
    {:id => 7,
      :name => 'hospital',
      :size => :large,
      :floors => 1,
      :build_ap => 25,
      :build_xp_type => :herbal,
      :build_xp => 25,
      :build_skill => :hospitaller,
      :prereq => :longhouse2,
      :settlement_level => :village,
      :max_hp => 50,
      :materials => {:thyme => 7, :bark => 7, :poultice => 7},
      
      :use_skill => :medicine,
      :effect_bonus => {:heal => 1.5, :revive => 1.5},
      :craft_ap_bonus => {:heal => 0.7, :revive => 0.7},
      
      :build_msg => "You organise your medicinal supplies and establish a hospital in this building.",
      :interior => "You are inside a large wooden building. " +
      "Various medicinal supplies are arranged here, " +
      "and dried herbs hang from the ceiling"
    },
    
    :signpost =>
    {:id => 8,
      :name => 'signpost',
      :size => :small,
      :floors => 0,
      :max_hp => 5,
      :build_skill => :trailblazing,
      :build_ap => 20,
      :build_xp => 5,
      :materials => {:timber => 2},
      :build_msg => "You build a signpost."
    },
    
    :field => 
    {:id => 9,
      :name => 'field',
      :special => :terrain,
      :terrain_type => :empty_field,
      :tools => [:digging_stick],
      :build_hp => 2,
      :build_ap => 25,
      :build_xp => 10,
      :build_xp_type => :herbal,
      :build_skill => :agriculture,
      :build_msg => "It's tiring work, but you manage to turn over the soil in the area, leaving several furrows in which to plant crops."
    },
    
    :dirt_track => 
    {:id => 10,
      :name => 'dirt track',
      :special => :terrain,
      :terrain_type => :dirt_track,
      :tools => [:digging_stick],
      :build_hp => 0,
      :build_ap => 20,
      :build_xp => 12,
      :build_skill => :trailblazing,
      :build_msg => "It's tiring work, but you manage to remove the turf in the area, leaving a dirt track."
    },
    
    :hunters_shrine =>
    {:id => 11,
      :name => "hunter's shrine",
      :size => :small,
      :prereq => :hut,
      :floors => 1,
      :max_hp => 30,
      :ap_recovery => +1,
      :build_ap => 50,
      :build_xp => 50,
      :build_skill => :divine_inspiration,
      :materials => {:pelt => 1,  :small_pelt => 1, :stone_spear => 3, :sabre_tooth => 2, :wolf_pelt => 1, :lion_pelt => 1, :bear_skin => 1, :croc_skin => 1, :horn => 2, :antler => 2},
      
      :build_msg =>  "Incanting the ritual words of the hunter's song, you make your offering to the animal spirits. You sense that they are pleased with your gifts; this building is now a shrine for all hunters.",
      :interior => "You are in a wooden shrine, decorated with hunter's trophies. " +
      "A faint echo of birdsong catches your ear. " +
      "Despite the tranquil atmosphere within this building, " +
      "you tread carefully, fearful of angering the animal spirits"
    },
    
    :stonemasonry =>
    {:id => 12,
      :name => 'stonemasonry',
      :size => :large,
      :floors => 1,
      :max_hp => 50,
      
      :build_skill => :masonry,
      :build_ap => 35,
      :build_xp => 35,
      :prereq => :workshop,
      :settlement_level => :village,
      :materials => {:boulder => 2, :stone => 6, :masonry_tools => 4},
      
      :build_msg => "You assemble work benches and organise your tools, " +
      "setting up a stonemasonry in this building.",
      :interior => "You are inside a large wooden building. " +
      "Workbenches and stone-working tools are lying around, " +
      "and chips of stone are scattered across the floor"
    },
    
    :cottage1 =>
    {:id => 131,
      :name => 'cottage (1/2)',
      :size => :small,
      :floors => 0,
      :max_hp => 40,
      
      :build_ap => 50,
      :build_xp => 35,
      :build_skill => :masonry,
      :tools => [:masonry_tools],
      :materials => {:stone_block => 6},
      :build_msg =>  "You dig trenches for a foundation, then set to work building the walls of the cottage. It isn't finished yet: you still need to build the roof."
    },
    
    :cottage2 => 
    {:id => 13,
      :name => 'cottage',
      :size => :small,
      :floors => 1,
      :ap_recovery => +1,
      :max_hp => 70,
      
      :build_ap => 50,
      :build_xp => 35,
      :prereq => :cottage1,
      :build_skill => :construction,
      :materials => {:timber => 10},
      :build_msg => "You build the roof, and the cottage is complete.",
      :interior => "You are inside a cosy stone cottage. " +
      "Sunlight streams through the open doorway"
    },
    
    :kiln =>
    {:id => 14,
      :name => 'kiln',
      :size => :small,
      :floors => 0,
      :max_hp => 50,
      :settlement_level => :village,
      
      :build_ap => 50,
      :build_xp => 35,
      :build_skill => :masonry,
      :tools => [:masonry_tools],
      :materials => {:stone_block => 7},
      :build_msg =>  "Digging a small firepit in the ground, you build a stone covering around and over it, creating a kiln."
    },
    
    :bakery =>
    {:id => 15,
      :name => 'bakery',
      :size => :big,
      :floors => 1,
      :max_hp => 50,
      :settlement_level => :village,
      :prereq => :longhouse2,
      
      :build_ap => 50,
      :build_xp => 35,
      :build_skill => :masonry,
      :tools => [:masonry_tools],
      :materials => {:stone_block => 7},
      :build_msg =>  "You build a stone oven in the building, " +
      "converting it into a bakery.",
      :interior => "You are inside a wooden building. " +
      "The smell of baking bread hits your nose and a pleasant warmth fills the air"
    },
  },
  
  :item =>
  {
    :stick =>
    {:id => 1,
      :name => 'stick',
      :plural => 'sticks',
      :desc => 'a sturdy wooden stick',
      :weight => 1,
      
      :use => :weapon,
      :break_odds => 10,
      :accuracy => 25,
      :effect => 1,
      :weapon_class => :blunt,
      
      :craftable => true,
      :craft_ap => 6,
      :craft_xp => 3,
      :craft_amount => 6,
      :materials => {:log => 1},
      :tools => [:stone_axe],
      
      :Autumn => 0.8,
      :Winter => 0.7
    },
    
    :stone =>
    {:id => 2,
      :name => 'stone',
      :plural => 'stones',
      :desc => 'a good-sized stone',
      :use => :weapon,
      :weight => 2,
      :break_odds => 2,
      :accuracy => 15,
      :effect => 1,
      :weapon_class => :blunt,
    },
    
    :thyme =>
    {:id => 3,
      :name => 'thyme sprig',
      :plural => 'thyme sprigs',
      :desc => 'a sprig of thyme, good for healing',
      :use => :heal,
      :effect => {:default => 5, :herb_lore => 7},
      :weight => 0,
      :Autumn => 0.7,
      :Winter => 0.5
    },
    
    :bark =>
    {:id => 4,
      :name => 'piece of willow bark',
      :plural => 'pieces of willow bark',
      :desc => 'some willow bark, good for healing',
      :use => "Using the willow bark doesn't seem to have any effect. Perhaps it would be nore useful if combined with something else",
      :weight => 0,
      :Autumn => 0.7,
      :Winter => 0.5
    },
    
    :poultice =>
    {:id => 5,
      :name => 'herbal poultice',
      :plural => 'herbal poultices',
      :desc => 'a herbal poultice, for reviving',
      :use => :revive,
      :effect => 5,
      :weight => 0,
      :craftable => true,
      :craft_ap => 10,
      :craft_xp => 5,
      :craft_xp_type => :herbal,
      :materials => {:thyme => 5, :bark => 2}
    },
    
    :flint =>
    {:id => 6,
      :name => 'flint',
      :plural => 'flints',
      :desc => 'a good-sized piece of flint',
      
      :weight => 2,
    },
    
    :hand_axe =>
    {:id => 7,
      :name => 'hand axe',
      :plural => 'hand axes',
      :desc => 'a hand axe',
      :use => :weapon,
      :weight => 2,
      :break_odds => 2,
      :accuracy => {:default => 15, :axe1 => 20, :axe2 => 30, :axe4 => 40},
      :effect => {:default => 2, :axe3 => 3},
      :weapon_class => :slash,
      :craftable => true,
      :craft_ap => 10,
      :craft_xp => 10,
      :tools => [:stone],
      :materials => {:flint => 1}
    },
    
    :stone_axe =>
    {:id => 8,
      :name => 'stone axe',
      :plural => 'stone axes',
      :desc => 'a stone axe',
      :use => :weapon,
      :break_odds => 2,
      :weapon_class => :slash,
      :accuracy => {:default => 20, :axe2 => 30, :axe4 => 40},
      :effect => {:default => 2, :axe1 => 3, :axe3 => 4},
      :weight => 4,
      :craftable => true,
      :craft_ap => 10,
      :craft_xp => 5,
      :craft_skill => :hafting,
      :materials => {:hand_axe => 1, :stick => 1}
    },
    
    :staff =>
    {:id => 9,
      :name => 'staff',
      :plural => 'staves',
      :desc => 'a stout wooden staff',
      :use => :weapon,
      :break_odds => 5,
      :accuracy => 25,
      :effect => 2,
      :weapon_class => :blunt,
      :weight => 3,
      
      :craftable => true,
      :craft_ap => 12,
      :craft_xp => 5,
      :craft_amount => 3,
      :materials => {:log => 1},
      :tools => [:stone_carpentry],
      :craft_skill => :carpentry,
      
      :Autumn => 0.8,
      :Winter => 0.7
    },
    
    :stone_spear =>
    {:id => 10,
      :name => 'stone spear',
      :plural => 'stone spears',
      :desc => 'a stone spear',
      :use => :weapon,
      :weight => 5,
      :break_odds => 2,
      :weapon_class => :stab,
      
      :accuracy => {:default => 30, :spear2 => 40, :spear4 => 50},
      :effect => {:default => 2, :spear1 => 3, :spear3 => 4},
      :craftable => true,
      :craft_ap => 10,
      :craft_xp => 10,
      :craft_skill => :hafting,
      :materials => {:hand_axe => 1, :staff => 1}
    },
    
    :chestnut =>
    {:id => 11,
      :name => 'handful of chestnuts',
      :plural => 'handfuls of chestnuts',
      :desc => 'a handful of chestnuts',
      :use => :food,
      :weight => 1,
      :Autumn => 1.3,
      :Winter => 0.5
    },
    
    :onion =>
    {:id => 12,
      :name => 'wild onion',
      :plural => 'wild onions',
      :desc => 'a pungent wild onion',
      :use => :food,
      :weight => 1,
      :Autumn => 0.7,
      :Winter => 0.5
    },
    
    :tea =>
    {:id => 13,
      :name => 'cup of herbal tea',
      :plural => 'cups of herbal tea',
      :desc => 'a fragrant cup of herbal tea, for reviving',
      :use => :revive,
      :effect => 20,
      :weight => 1,
      :craftable => true,
      :craft_ap => 10,
      :craft_xp => 5,
      :craft_xp_type => :herbal,
      :craft_building => :campfire,
      :craft_skill => :tea_making,
      :materials => {:thyme => 2, :bark => 2}
    },
    
    :digging_stick =>
    {:id => 14,
      :name => 'digging stick',
      :plural => 'digging sticks',
      :desc => 'a sharpened stick for digging',
      :weight => 2,
      :break_odds => 20,
      :craftable => true,
      :craft_ap => 5,
      :craft_xp => 3,
      :craft_building => :campfire,
      :tools => [:hand_axe],
      :materials => {:stick => 1}
    },
    
    :log =>
    {:id => 15,
      :name => 'log',
      :plural => 'logs',
      :desc => 'a heavy wooden log',
      
      :weight => 12,
    },
    
    :raw_meat =>
    {:id => 16,
      :name => 'hunk of raw meat',
      :plural => 'hunks of raw meat',
      :desc => 'a hunk of raw meat',
      :use => 'You must cook the meat before it can be eaten.',
      :weight => 1,
    },
    
    :pelt =>
    {:id => 17,
      :name => 'pelt',
      :plural => 'pelts',
      :desc => 'an animal\'s hide',
      
      :weight => 4,
    },
    
    :cooked_meat =>
    {:id => 18,
      :name => 'hunk of cooked meat',
      :plural => 'hunks of cooked meat',
      :desc => 'a hunk of cooked meat',
      :use => :food,
      :weight => 1,
      :craftable => true,
      :craft_ap => 1,
      :craft_xp => 0.3,
      :craft_xp_type => :wander,
      :craft_building => :campfire,
      :materials => {:raw_meat => 1}
    },
    
    :stone_carpentry =>
    {:id => 19,
      :name => 'set of stone carpentry tools',
      :plural => 'sets of stone carpentry tools',
      :desc => 'a set of stone carpentry tools, including an adze, saw and lathe',
      
      :weight => 8,
      :break_odds => 4,
      :craftable => true,
      :craft_ap => 15,
      :craft_xp => 15,
      :craft_skill => :carpentry,
      :materials => {:hand_axe => 4, :stick => 4}
    },
    
    :timber =>
    {:id => 20,
      :name => 'plank of timber',
      :plural => 'planks of timber',
      :desc => 'a carved wooden plank, for construction',
      
      :weight => 3,
      
      :craftable => true,
      :craft_ap => 12,
      :craft_xp => 5,
      :craft_amount => 3,
      :materials => {:log => 1},
      :tools => [:stone_carpentry],
      :craft_skill => :carpentry,
    },
    
    :wheat =>
    {:id => 21,
      :name => 'handful of wheat',
      :plural => 'handfuls of wheat',
      :desc => 'some wheat',
      :use => :food,
      :plantable => true,
      :weight => 1,
      :Autumn => 0.5,
      :Winter => 0
    },
    
    :stone_sickle =>
    {:id => 22,
      :name => 'stone sickle',
      :plural => 'stone sickles',
      :desc => 'a stone sickle',
      
      :weight => 2,
      :break_odds => 2,
      :craftable => true,
      :craft_ap => 10,
      :craft_xp => 10,
      :craft_skill => :carpentry,
      :craft_building => :workshop,
      :tools => [:stone_carpentry],
      :materials => {:hand_axe => 1, :stick => 1}
    },
    
    :noobcake =>
    {:id => 23,
      :name => 'noobcake',
      :plural => 'noobcakes',
      :desc => 'a cake decorated with a picture of a cuddly bear surrounded by pink hearts',
      :use => :noobcake,
      :weight => 1,
    },
    
    :fist =>
    {:id => 24,
      :name => 'fist',
      :plural => 'fists',
      :use => :weapon,
      :break_odds => 0,
      
      :weapon_class => :blunt,
      :weight => 0,
      
      :accuracy => {:default => 10, :unarmed2 => 20},
      :effect => {:default => 1, :unarmed1 => 1},
    },
    
    :test_weapon =>
    {:id => 25,
      :name => 'hammer of the gods',
      :desc => 'And I will punish the world for their evil, and the wicked for their iniquity; and I will cause the arrogance of the proud to cease, and will lay low the haughtiness of the terrible',
      :plural => 'hammers of the gods',
      :effect => 10,
      :weight => 1,
      :use => :weapon,
      :accuracy => 100,
      :weapon_class => :blunt,
      :break_odds => 0,
    },
    
    :sabre_tooth =>
    {:id => 26,
      :name => 'sabre tooth',
      :plural => 'sabre teeth',
      :use => :weapon,
      :weapon_class => :stab,
      :desc => "a curved yellow fang, as long as a man's forearm",
      :weight => 2,
      :break_odds => 5,
      :accuracy => 25,
      :effect => 3,
    },
    
    :test_weapon2 =>
    {:id => 27,
      :name => 'unusable test weapon',
      :desc => 'unusable test weapon',
      :plural => 'unusable test weapon',
      :effect => 10,
      :weight => 1,
      :use => :weapon,
      :accuracy => 0,
      :weapon_class => :stab,
      :break_odds => 0,
    },
    
    :small_pelt =>
    {:id => 28,
      :name => 'small pelt',
      :plural => 'small pelts',
      :desc => 'the hide of a small animal',
      :weight => 2,
    },
    
    :wolf_pelt =>
    {:id => 29,
      :name => 'wolf pelt',
      :plural => 'wolf pelts',
      :desc => 'the hide of a wolf',
      :weight => 4,
    },
    
    :bear_skin =>
    {:id => 30,
      :name => 'bear skin',
      :plural => 'bear skins',
      :desc => 'the hide of a bear',
      :weight => 10,
    },
    
    :croc_skin =>
    {:id => 31,
      :name => 'crocodile skin',
      :plural => 'crocodile skins',
      :desc => 'the hide of a crocodile',
      :weight => 6,
    },
    
    :horn =>
    {:id => 32,
      :name => 'horn',
      :plural => 'horns',
      :desc => 'the horn of some animal',
      :weight => 3,
      
      :use => :weapon,
      :weapon_class => :stab,
      :break_odds => 5,
      :accuracy => 20,
      :effect => 2,
    },
    
    :rotten_food =>
    {:id => 33,
      :name => 'lump of rotten food',
      :plural => 'lumps of rotten food',
      :desc => "whatever it was, it's not edible anymore",
      :weight => 1,
    },
    
    :clay =>
    {:id => 34,
      :name => 'lump of clay',
      :plural => 'lumps of clay',
      :desc => "a lump of clay",
      :weight => 2,
    },
    
    :gold_coin =>
    {:id => 35,
      :name => 'gold coin',
      :plural => 'gold coins',
      :desc => "a gold disk with some mysterious etchings on the surface",
      :weight => 0,
    },
    
    :antler =>
    {:id => 36,
      :name => 'antler',
      :plural => 'antlers',
      :desc => "a magnificent antler",
      :weight => 4,
    },
    
    :bone_pick =>
    {:id => 37,
      :name => 'bone pick',
      :plural => 'bone picks',
      :desc => 'a pick crafted from bone or antler',
      :weight => 3,
      :break_odds => 5,
      
      :craftable => true,
      :craft_ap => 10,
      :craft_xp => 10,
      :craft_skill => :carpentry,
      :craft_building => :workshop,
      :tools => [:stone_carpentry],
      :materials => {:antler => 1}
    },
    
    :boulder =>
    {:id => 38,
      :name => 'boulder',
      :plural => 'boulders',
      :desc => "a large, heavy boulder",
      :weight => 6,
    },
    
    :masonry_tools =>
    {:id => 39,
      :name => 'set of masonry tools',
      :plural => 'sets of masonry tools',
      :desc => 'a set of stone masonry tools, including a chisel, hammer and rock drill',
      
      :weight => 8,
      :break_odds => 4,
      :craftable => true,
      :craft_ap => 15,
      :craft_xp => 15,
      :craft_building => :workshop,
      :craft_skill => :carpentry,
      :tools => [:stone_carpentry],
      :materials => {:hand_axe => 2, :stone => 2, :stick => 4}
    },
    
    :stone_block =>
    {:id => 40,
      :name => 'stone block',
      :plural => 'stone blocks',
      :desc => 'a large stone block, for construction',
      
      :weight => 4,
      :craftable => true,
      :craft_ap => 10,
      :craft_xp => 6,
      :craft_building => :stonemasonry,
      :craft_skill => :stone_working,
      :tools => [:masonry_tools],
      :materials => {:boulder => 1}
    },
    
    :pot =>
    {:id => 41,
      :name => 'pot',
      :plural => 'pots',
      :desc => 'the legal kind',
      :weight => 3,
      
      :craftable => true,
      :craft_ap => 10,
      :craft_xp => 5,
      :craft_skill => :pottery,
      :craft_building => :kiln,
      :materials => {:clay => 3}
    },
    
    :lion_pelt =>
    {:id => 42,
      :name => 'lion pelt',
      :plural => 'lion pelts',
      :desc => 'the hide of a lion',
      :weight => 6,
    },
    
    :water_pot =>
    {:id => 43,
      :name => 'pot of water',
      :plural => 'pots of water',
      :desc => 'a clay pot filled with water',
      :weight => 10,
    },
    
    :ocarina =>
    {:id => 44,
      :name => 'ocarina',
      :plural => 'ocarinas',
      :desc => 'a small wind instrument',
      :use => "You play a haunting melody on your ocarina.",
      
      :weight => 1,
      :craftable => true,
      :craft_ap => 7,
      :craft_xp => 5,
      :craft_building => :kiln,
      :craft_skill => :pottery,
      :materials => {:clay => 1}
    },
    
    :grinding_stone =>
    {:id => 45,
      :name => 'grinding stone',
      :plural => 'grinding stones',
      :desc => 'a heavy stone for grinding',
      :weight => 4,
      
      :craftable => true,
      :craft_ap => 10,
      :craft_xp => 6,
      :craft_building => :stonemasonry,
      :craft_skill => :stone_working,
      :tools => [:masonry_tools],
      :materials => {:boulder => 1}
    },
    
    :flour_pot =>
    {:id => 46,
      :name => 'pot of flour',
      :plural => 'pots of flour',
      :desc => 'a pot full of flour',
      :weight => 7,
      
      :craftable => true,
      :craft_ap => 20,
      :craft_xp => 5,
      :craft_skill => :milling,
      :tools => [:grinding_stone, :stone],
      :materials => {:wheat => 3, :pot => 1}
    },
    
    :bread =>
    {:id => 47,
      :name => 'flatbread',
      :plural => 'flatbreads',
      :desc => 'a flat loaf of bread',
      :weight => 1,
      :use => :food,
      
      :craftable => true,
      :craft_amount => 6,
      :craft_ap => 8,
      :craft_xp => 4,
      :craft_xp_type => :herbal,
      :craft_skill => :baking,
      :craft_building => :bakery,
      :materials => {:flour_pot => 1, :water_pot => 1},
      :extra_products => {:pot => 2}
    },
    
    :honeycomb =>
    {:id => 48,
      :name => 'honeycomb',
      :plural => 'honeycombs',
      :desc => 'a honeycomb, good for healing',
      :use => :heal,
      :effect => {:default => 3, :herb_lore => 5},
      :weight => 1,
    },
    
  },
  
  :region =>
  {
    :Gods_Glade =>
    {:id => 1,
      :name => 'Gods Glade',
    },
    
    :Midlands =>
    {:id => 2,
      :name => 'The Midlands',
      :animals_per_100 => {:deer => 1.5, :boar => 2, :wolf => 0.7}
    },
    
    :Wilderness =>
    {:id => 3,
      :name => 'The Wilderness',
    },
    
    :Hermit_Lake =>
    {:id => 4,
      :name => 'Hermit Lake',
      :animals_per_100 => {:hare => 1.6, :goose => 1.8, :sabre_tooth => 0.2} 
    },
    
    :Ferals =>
    {:id => 5,
      :name => 'The Feral Hills',
      :animals_per_100 => {:deer => 1, :stag => 0.2, :mountain_lion => 0.3}
    },
    
    :Euphenics =>
    {:id => 7,
      :name => 'River Euphenics'
    },
    
    :Another_River => 
    {:id => 6,
      :name => 'Another River'
    },
    
    :Border_Lake => 
    {:id => 8,
      :name => 'Lake Bokrug'
    },
    
    :Border_River => 
    {:id => 9,
      :name => 'Border River',
      :animals_per_100 => {:goose => 1}
    },
    
    :Eastern_Marshes => 
    {:id => 10,
      :name => 'Strongholm Marshes',
      :animals_per_100 => {:goose => 1.5, :croc => 0.6}
    },
    
    :Islands => 
    {:id => 11,
      :name => 'Scavenger Isles',
      :animals_per_100 => {:goose => 2, :pheasant => 1}
    },
    
    :Latis_Plains => 
    {:id => 12,
      :name => 'Latis Plains',
      :animals_per_100 => {:buffalo => 1.4, :sabre_tooth => 0.2} 
    },
    
    :River_Dea => 
    {:id => 13,
      :name => 'River Dea',
      :animals_per_100 => {:goose => 0.6, :croc => 0.2} 
    },
    
    :Sacred_Hill => 
    {:id => 14,
      :name => 'Sacred Hill'
    },
    
    :Dark_Forest => 
    {:id => 15,
      :name => 'The Dark Forest',
      :animals_per_100 => {:boar => 2, :wolf => 0.5, :bear => 0.2, :squirrel => 0.2} 
    },
    
    :Wandering_Creek => 
    {:id => 16,
      :name => 'Wandering Creek'
    },
    
    :Weeping_Woods => 
    {:id => 17,
      :name => 'Weeping Woods',
      :animals_per_100 => {:boar => 2, :pheasant => 2, :squirrel => 0.5} 
    },
    
    :Winding_River => 
    {:id => 18,
      :name => 'Winding River'
    },
    
    :Northern_Crags => 
    {:id => 19,
      :name => 'Northern Crags'
    },
    
    :Westwood =>
    {:id => 20,
      :name => 'The Westwood',
      :animals_per_100 => {:beehive => 0.5, :bear => 0.2, :stag => 1} 
    },
    
    :New_2 =>
    {:id => 21,
      :name => 'Terra Nullis Er',
    },
    
    :New_3 =>
    {:id => 22,
      :name => 'Terra Nullis San',
    },
    
    :New_4 =>
    {:id => 23,
      :name => 'Terra Nullis Si',
    },
    
    :New_5 =>
    {:id => 24,
      :name => 'Terra Nullis Wu',
    },
    
    :New_6 =>
    {:id => 25,
      :name => 'Terra Nullis Liu',
    },
    
    :New_7 =>
    {:id => 26,
      :name => 'Terra Nullis Qi',
    },
    
    :New_8 =>
    {:id => 27,
      :name => 'Terra Nullis Ba',
    },
    
    :New_9 =>
    {:id => 28,
      :name => 'Terra Nullis Jiu',
    },
    
  },
  
  :skill =>
  {
    :agriculture =>
    {:id => 1,
      :name => 'agriculture',
      :type => :herbalist,
      :desc => 'dig fields, plant and tend crops',
      :prereq => nil
    },
    
    :artisanship =>
    {:id => 2,
      :name => 'artisanship',
      :type => :crafter,
      :desc => 'convert longhouses into workshops',
      :prereq => :carpentry
    },    
    
    :axe1 =>
    {:id => 3,
      :name => 'basic axe',
      :type => :warrior,
      :desc => 'axes do +1 damage',
      :prereq => nil
    }, 
    
    :axe2 =>
    {:id => 4,
      :name => 'skilled axe',
      :type => :warrior,
      :desc => 'axes hit with +10% accuracy',
      :prereq => :axe1
    }, 
    
    :axe3 =>
    {:id => 5,
      :name => 'advanced axe',
      :type => :warrior,
      :desc => 'axes do an additonal +1 damage',
      :prereq => :axe2
    }, 
    
    :axe4 =>
    {:id => 6,
      :name => 'elite axe',
      :type => :warrior,
      :desc => 'axes hit with an additional +10% accuracy',
      :prereq => :axe3
    }, 
    
    :baking =>
    {:id => 35,
      :name => 'baking',
      :type => :herbalist,
      :desc => 'bake bread',
      :prereq => nil
    },
    
    :butchering =>
    {:id => 7,
      :name => 'butchering',
      :type => :wanderer,
      :desc => 'obtain more meat from slain animals',
      :prereq => :foraging
    },
    
    :carpentry =>
    {:id => 8,
      :name => 'carpentry',
      :type => :crafter,
      :desc => 'craft timber, sickles, and carpentry tools; crafting costs less AP when in a workshop',
      :prereq => :hafting
    }, 
    
    :construction =>
    {:id => 9,
      :name => 'construction',
      :type => :crafter,
      :desc => 'build huts and longhouses',
      :prereq => nil
    }, 
    
    :divine_inspiration =>
    {:id => 28,
      :name => 'divine inspiration',
      :type => :crafter,
      :desc => 'build shrines and other religious buildings',
      :prereq => :artisanship
    }, 
    
    :foraging =>
    {:id => 10,
      :name => 'foraging',
      :type => :wanderer,
      :desc => 'see the availability of resources when searching',
      :prereq => nil
    },
    
    :forest_walk =>
    {:id => 11,
      :name => 'forest walk',
      :type => :wanderer,
      :desc => 'reduces the AP cost to move through forest squares',
      :prereq => nil
    }, 
    
    :hafting =>
    {:id => 13,
      :name => 'hafting',
      :type => :crafter,
      :desc => 'create stone axes and stone spears',
      :prereq => nil
    }, 
    
    :herb_lore =>
    {:id => 12,
      :name => 'herb lore',
      :type => :herbalist,
      :desc => 'thyme leaves provide better healing',
      :prereq => nil
    }, 
    
    :hospitaller =>
    {:id => 14,
      :name => 'hospitaller',
      :type => :herbalist,
      :desc => 'estalish new hospitals in longhouse buildings',
      :prereq => :medicine
    }, 
    
    :javelin =>
    {:id => 26,
      :name => 'javelin',
      :type => :warrior,
      :desc => 'use spears as a ranged weapon',
      :prereq => :spear1
    }, 
    
    :lumberjack =>
    {:id => 15,
      :name => 'lumberjack',
      :type => :wanderer,
      :desc => 'halves the AP cost to chop down trees',
      :prereq => nil
    },
    
    :masonry =>
    {:id => 32,
      :name => 'masonry',
      :type => :crafter,
      :desc => 'convert workshops into stonemasonries; build stone buildings',
      :prereq => :stone_working
    },
    
    :medicine =>
    {:id => 16,
      :name => 'medicine',
      :type => :herbalist,
      :desc => 'heal more effectively and craft healing items for less AP when inside a hospital',
      :prereq => :herb_lore
    },
    
    :milling =>
    {:id => 34,
      :name => 'milling',
      :type => :crafter,
      :desc => 'grind wheat into flour',
      :prereq => nil
    },
    
    :mountaineering =>
    {:id => 17,
      :name => 'mountaineering',
      :type => :wanderer,
      :desc => 'scale cliffs, and reduced AP cost to move through hill and mountain squares',
      :prereq => :forest_walk
    }, 
    
    :pottery =>
    {:id => 33,
      :name => 'pottery',
      :type => :crafter,
      :desc => 'craft clay pots',
      :prereq => :stone_working
    },    
    
    :quarrying =>
    {:id => 30,
      :name => 'quarrying',
      :type => :crafter,
      :desc => 'quarry stones from cliffs',
      :prereq => nil
    },    
    
    :settling =>
    {:id => 27,
      :name => 'settling',
      :type => :wanderer,
      :desc => 'can establish new settlements',
      :prereq => nil
    }, 
    
    :spear1 =>
    {:id => 18,
      :name => 'basic spear',
      :type => :warrior,
      :desc => 'spears do +1 damage',
      :prereq => nil
    }, 
    
    :spear2 =>
    {:id => 19,
      :name => 'skilled spear',
      :type => :warrior,
      :desc => 'spears hit with +10% accuracy',
      :prereq => :spear1
    }, 
    
    :spear3 =>
    {:id => 20,
      :name => 'advanced spear',
      :type => :warrior,
      :desc => 'spears do an additonal +1 damage',
      :prereq => :spear2
    }, 
    
    :spear4 =>
    {:id => 21,
      :name => 'elite spear',
      :type => :warrior,
      :desc => 'spears hit with an additional +10% accuracy',
      :prereq => :spear3
    }, 
    
    :stone_working =>
    {:id => 31,
      :name => 'stone working',
      :type => :crafter,
      :desc => 'craft stone blocks, millstones, and masonry tools',
      :prereq => :quarrying
    },
    
    :swimming =>
    {:id => 22,
      :name => 'swimming',
      :type => :wanderer,
      :desc => 'reduces the AP cost to move through water squares, and can enter deep water',
      :prereq => :forest_walk
    }, 
    
    :tea_making =>
    {:id => 23,
      :name => 'tea making',
      :type => :herbalist,
      :desc => 'create revitalising herbal teas',
      :prereq => nil
    }, 
    
    :tracking =>
    {:id => 29,
      :name => 'tracking',
      :type => :wanderer,
      :desc => 'animals and people are visible on the map screen',
      :prereq => :foraging
    },
    
    :trailblazing =>
    {:id => 24,
      :name => 'trailblazing',
      :type => :crafter,
      :desc => 'build dirt tracks',
      :prereq => :construction
    }, 
    
    :triage =>
    {:id => 25,
      :name => 'triage',
      :type => :herbalist,
      :desc => 'see the health level of injured people',
      :prereq => :herb_lore
    }, 
    
    :unarmed1 =>
    {:id => 36,
      :name => 'basic Shin-Jitsu',
      :type => :warrior,
      :desc => 'fists hit with an additional 10% accuracy',
      :prereq => nil
    }, 
    
    :unarmed2 =>
    {:id => 37,
      :name => 'skilled Shin-Jitsu',
      :type => :warrior,
      :desc => 'fists do +1 damage',
      :prereq => :unarmed1
    }, 
  },
  
  :terrain =>
  {
    :grassland =>
    {:id => 1,
      :ap => 1,
      :altitude => 0,
      :image => 'p_grass.jpg',
      :build_small? => true,
      :build_large? => true,
      :class => :open,
      :search => {:onion => 12, :thyme => 12, :wheat => 5},
      :Spring => 'You are walking through a verdant grassland. Some small flowers are starting to grow here.',
      :Summer => 'You are walking through a verdant grassland, with many dandelions and other flowers. Crickets are chirping in the long grass.',
      :Autumn => 'You are walking through a grassland. The cold weather is beginning to turn the grass brown.',
      :Winter => 'You are walking through a grassland. Frost has hardened the ground, and there is little sign of life.',
      
    },
    
    :forest =>
    {:id => 2,
      :ap => {:forest_walk => 1, :default => 2},
      :xp => 0.2,
      :altitude => 0,
      :image => 'p_forest.jpg',
      :class => :forest,
      :transition => :thick_forest,
      :transition_odds => {:default => 0, :Spring => 15, :Summer => 30},
      :build_small? => true,
      :actions => [:chop_tree],
      :search => {:stick => 25, :staff => 8, :bark => 10, :chestnut => 15},
      :Spring => 'You are in a forest. Shafts of sunlight shine through the trees.',
      :Summer => 'You are in a forest. The leafy tree cover overhead provides some shade from the hot sun.',
      :Autumn => 'You are in a forest, walking through a thick carpet of orange and brown leaves.',
      :Winter => 'You are in a forest. The bare branches of the trees are stark against the winter sky.',
    },
    
    :pine_forest_1 =>
    {:id => 21,
      :ap => 1,
      :xp => 0.1,
      :altitude => 0,
      :image => 'p_lightforest.jpg',
      :class => :forest,
      :transition => :pine_forest_2,
      :transition_odds => {:default => 0, :Spring => 25, :Summer => 40},
      :build_small? => true,
      :actions => [:chop_tree],
      :search => {:stick => 25, :staff => 8},
      
      :description => 'A number of tall pine trees tower above you here.',
      :Autumn => 'A number of tall pine trees tower above you here, ' +
      'and pine cones crunch underfoot.',
      :Winter => 'A number of tall pine trees tower above you here, ' +
      'with snow hanging off the branches of the trees.',
    },
    
    :pine_forest_2 =>
    {:id => 22,
      :ap => {:forest_walk => 1, :default => 2},
      :xp => 0.2,
      :altitude => 0,
      :image => 'p_forest.jpg',
      :class => :forest,
      :transition => :pine_forest_3,
      :transition_odds => {:default => 0, :Spring => 25, :Summer => 40},
      :build_small? => true,
      :actions => [:chop_tree],
      :search => {:stick => 25, :staff => 8},
      
      :Spring => 'You are in an evergreen forest. Tall pine trees tower above you.',
      :Summer => 'You are in an evergreen forest. Shafts of sunlight shine ' +
      'through the tall pine trees.',
      :Autumn => 'You are in an evergreen forest. Pine cones crunch underfoot.',
      :Winter => 'You are in a pine forest. Snow hangs heavy on the branches ' +
      'of the trees.',
    },
    
    :pine_forest_3 =>
    {:id => 23,
      :ap => {:forest_walk => 2, :default => 3},
      :xp => 0.3,
      :altitude => 0,
      :image => 'p_denseforest.jpg',
      :class => :forest,
      :build_small? => true,
      :actions => [:chop_tree],
      :search => {:stick => 25, :staff => 8},
      
      :description => 'You are walking through a dense evergreen forest, ' +
      'your journey hampered by a thick wall of pine branches.',
      :Summer => 'You are in an evergreen forest. ' +
      'Sunlight barely penetrates the thick tangle of pine branches overhead.',
      :Winter => 'You are in a dense pine forest. Snow hangs heavy on the branches ' +
      'of the trees.',
    },
    
    :wilderness =>
    {:id => 3,
      :ap => 2,
      :altitude => 0,
      :image => 'p_wilderness.jpg',
      :search => {'You can\'t expect to find anything in the wilderness!' => 90, 'You find nothingness - whiteness - endlessness - stretching beyond the human imagination... <i>desolation of the soul...</i> OH MY GOD!' => 10},
      :Spring => 'You are wandering through a seemingly endless wilderness.',
      :Summer => 'You are wandering through a seemingly endless wilderness. The hot sun beats down upon you.',
      :Autumn => 'You are wandering through a seemingly endless wilderness.',
      :Winter => 'You are wandering through a seemingly endless wilderness. A cold wind whistles through the desolate landscape.',
    },
    
    :cleared_wood =>
    {:id => 4,
      :ap => 1,
      :build_small? => true,
      :build_large? => true,
      :class => :open,
      :altitude => 0,
      :image => 'p_grass.jpg',
      :search => {:onion => 12, :thyme => 12, :wheat => 5},
      
      :transition => :woodland,
      :transition_odds => {:default => 0, :Spring => 10},
      
      :Spring => 'You are walking through a verdant grassland. Some small flowers are starting to grow here.',
      :Summer => 'You are walking through a verdant grassland, with many dandelions and other flowers. Crickets are chirping in the long grass.',
      :Autumn => 'You are walking through a grassland. The cold weather is beginning to turn the grass brown.',
      :Winter => 'You are walking through a grassland. Frost has hardened the ground, and there is little sign of life.',
      
    },
    
    :low_hillside =>
    {:id => 31,
      :ap => 1,
      :xp => 0.2,
      :altitude => 1, 
      :image => 'p_hill1_side.jpg',
      :search => {:flint => 10, :stone => 10},
      :class => :hill,
      :Spring => 'You are on the side of a hill, at low elevation. A light breeze is blowing.',
      :Summer => 'You are on the side of a hill, at low elevation. The hot sun shines down upon you.',
      :Autumn => 'You are on the side of a hill, at low elevation. A stiff breeze is blowing.',
      :Winter => 'You are on the side of a hill, at low elevation. A cold wind is blowing.',
    },
    
    :low_hilltop =>
    {:id => 41,
      :ap => 1,
      :xp => 0.2,
      :altitude => 1,
      :class => :hill,
      :image => 'p_hill1_top.jpg', 
      :build_small? => true,
      :search => {:flint => 10, :stone => 10},
      
      :Spring => 'You are atop a low hill, looking at the countryside stretching away in all directions.',
      :Summer => 'You are atop a low hill, looking at the verdant countryside stretching away in all directions.',
      :Autumn => 'You are atop a low hill, looking at the countryside slowly dissapearing into the autumn mist.',
      :Winter => 'You are atop a low hill, looking at the countryside stretching away in all directions. A cold wind is blowing.',
    },
    
    :mid_hillside =>
    {:id => 32,
      :ap => 1,
      :xp => 0.3,
      :altitude => 2, 
      :class => :hill,
      :image => 'p_hill2_side.jpg',
      :search => {:flint => 20, :stone => 10},
      :Spring => 'You are on the side of a hill, at medium elevation. A light breeze is blowing.',
      :Summer => 'You are on the side of a hill, at medium elevation. The hot sun shines down upon you.',
      :Autumn => 'You are on the side of a hill, at medium elevation. A stiff breeze is blowing.',
      :Winter => 'You are on the side of a hill, at medium elevation. A cold wind is blowing.',
    },
    
    :mid_hilltop =>
    {:id => 42,
      :ap => 1,
      :xp => 0.3,
      :altitude => 2,
      :class => :hill,
      :build_small? => true,
      
      :search => {:flint => 20, :stone => 10},
      :image => 'p_hill2_top.jpg',
      :Spring => 'You are atop a medium hill, looking at the countryside stretching away in all directions.',
      :Summer => 'You are atop a medium hill, looking at the verdant countryside stretching away in all directions.',
      :Autumn => 'You are atop a medium hill, looking at the countryside slowly dissapearing into the autumn mist.',
      :Winter => 'You are atop a medium hill, looking at the countryside stretching away in all directions. A cold wind is blowing.',
    },
    
    :high_hillside =>
    {:id => 33,
      :ap => 1,
      :xp => 0.4,
      :altitude => 3, 
      :class => :hill,
      :search => {:flint => 25, :stone => 10},
      :image => 'p_hill3_side.jpg',
      :Spring => 'You are on the side of a hill, at high elevation. A light breeze is blowing.',
      :Summer => 'You are on the side of a hill, at high elevation. The hot sun shines down upon you.',
      :Autumn => 'You are on the side of a hill, at high elevation. A stiff breeze is blowing.',
      :Winter => 'You are on the side of a hill, at high elevation. A cold wind is blowing.',
    },
    
    :high_hilltop =>
    {:id => 43,
      :ap => 1,
      :xp => 0.4,
      :altitude => 3,
      :class => :hill,
      :build_small? => true,
      :search => {:flint => 25, :stone => 10},
      :image => 'p_hill3_top.jpg',
      :Spring => 'You are atop a high hill, looking at the countryside stretching away in all directions.',
      :Summer => 'You are atop a high hill, looking at the verdant countryside stretching away in all directions.',
      :Autumn => 'You are atop a high hill, looking at the countryside slowly dissapearing into the autumn mist.',
      :Winter => 'You are atop a high hill, looking at the countryside stretching away in all directions. A cold wind is blowing.',
    },
    
    :stream =>
    {:id => 5,
      :class => :shallow_water,
      :ap => {:swimming => 2, :default => 4},
      :altitude => 0, 
      :image => 'p_river.jpg',
      :actions => [:fill],
      
      :Spring => 'You are wading through a small stream, cool water running over your feet.',
      :Summer => 'You are paddling through a small stream. The water is slow and murky.',
      :Autumn => 'You are wading through a small stream, cool water running over your feet.',
      :Winter => 'You are wading through a small stream. The water is ice cold and rapid.',
    },
    
    :lake_shore =>
    {:id => 51,
      :ap => 1,
      :altitude => 0,
      :class => :beach,
      :image => 'p_rshore.jpg',
      :Spring => 'You are on the rocky shore of a lake, sunlight glinting off the crests of small waves.',
      :Summer => 'You are on the rocky shore of a lake. The placid surface reflects the almost cloudless blue sky.',
      :Autumn => 'You are on the rocky shore of a lake. The water is grey and choppy.',
      :Winter => 'You are on the rocky shore of a lake. The water is grey and choppy.',
    },
    
    :shallow_lake =>
    {:id => 52,
      :class => :shallow_water,
      :ap => {:swimming => 2, :default => 4},
      :altitude => 0,
      :actions => [:fill],
      
      :image => 'p_river.jpg',
      :Spring => 'You are wading through shallow water, at the edge of a lake.',
      :Summer => 'You are wading through the shallow edge of a lake. The cool water brings relief from the heat of the sun.',
      :Autumn => 'You are wading through shallow water, at the edge of a lake.',
      :Winter => 'You are wading through shallow water, at the edge of a lake. The ice cold water chills you to the bone.', 
    },
    
    :deep_lake =>
    {:id => 53,
      :class => :deep_water,
      :ap => {:swimming => 4},
      :altitude => 0, 
      :image => 'p_dwater.jpg',
      :Spring => 'You are swimming through the deep water of a lake.',
      :Summer => 'You are swimming through the deep water of a lake. The cool water brings relief from the heat of the sun.',
      :Autumn => 'You are swimming through the deep water of a lake.',
      :Winter => 'You are swimming through the deep water of a lake. The cold water chills you to the bone.',
    },
    
    :rapids =>
    {:id => 54,
      :ap => 4,
      :altitude => 1, 
      :image => 'p_rapids.jpg',
      :Spring => 'You are wading through a rapid stream, tumbling down the hillside.',
      :Summer => 'You are wading through a rapid stream, tumbling down the hillside.',
      :Autumn => 'You are wading through a rapid stream, tumbling down the hillside.',
      :Winter => 'You are wading through a rapid stream, tumbling down the hillside.',
    },
    
    :shallow_river =>
    {:id => 55,
      :class => :shallow_water,
      :ap => {:swimming => 2, :default => 4},
      :altitude => 0, 
      :actions => [:fill],
      :image => 'p_river.jpg',
      
      :Spring => 'You are wading through a small river, cool water running over your feet.',
      :Summer => 'You are paddling through a small river. The water is slow and murky.',
      :Autumn => 'You are wading through a small river, cool water running over your feet.',
      :Winter => 'You are wading through a small river. The water is ice cold and rapid.',
      
    },
    
    :deep_river =>
    {:id => 56,
      :class => :deep_water,
      :ap => {:swimming => 4},
      :altitude => 0, 
      :image => 'p_dwater.jpg',
      :Spring => 'You are swimming through a deep river.',
      :Summer => 'You are swimming through a deep river. The cool water brings relief from the heat of the sun.',
      :Autumn => 'You are swimming through a deep river.',
      :Winter => 'You are swimming through a deep river. The cold water chills you to the bone.',
      
      
    },
    
    :flood_plain =>
    {:id => 57,
      :ap => 1.5,
      :altitude => 0, 
      :image => {:Spring => 'p_rapids.jpg', :default => 'p_flood.jpg'},
      :class => :wetland,
      :search => {:wheat => 15},
      :dig => {:clay => 40, :stone => 10, :gold_coin => 1},
      :actions => [:dig],
      
      :Spring => "You are wading through ankle-deep water; the Spring floods have come to the plains.",
      :Summer => "You are walking across a flood plain. The ground bakes beneath the sun.",
      :Autumn => "You are walking across a flood plain.",
      :Winter => "You are walking across a flood plain.",
    },
    
    :sand_beach =>
    {:id => 58,
      :ap => 1,
      :altitude => 0,
      :class => :beach,
      :image => 'p_beach.jpg',
      :search => {"Maybe you've found the place where you can stop searching..." => 100},
      
      :Spring => 'You are walking along a white sandy beach. Sunlight dapples on the water.',
      :Summer => 'You are walking along a white sandy beach. A cool breeze blows from the water, bringing relief from the hot sun.',
      :Autumn => 'You are walking along a white sandy beach.',
      :Winter => 'You are walking along a white sandy beach.',
    },
    
    :hot_spring =>
    {:id => 59,
      :ap => 3,
      :altitude => 0,
      :class => :shallow_water,
      :image => 'p_spring.jpg',
      :ap_recovery => +0.5,
      :actions => [:fill],
      
      :description => 'You are bathing in a hot spring. ' +
      'Sulphurous-smelling water bubbles out from under the ground.',
      :Autumn => 'You are bathing in a hot spring. ' +
      'The heat of the water brings welcome relief from the chilly air.',
      :Winter => 'You are bathing in a hot spring. ' +
      'The heat of the water brings welcome relief from the chilly air.'
    },
    
    :shallow_sea =>
    {:id => 151,
      :class => :shallow_water,
      :ap => {:swimming => 2, :default => 4},
      :altitude => 0,
      :actions => [:fill],
      :image => 'p_river.jpg',
      
      :Spring => 'You are paddling through shallow water, ' +
      'at the edge of an ocean that stretches to the horizon. ' +
      'Waves crash against the shore.',
      :Summer => 'You are paddling through shallow water, ' +
      'at the edge of an ocean that stretches to the horizon. ' +
      'Sunlight glints off the crest of the waves.',
      :Autumn => 'You are paddling through shallow water, ' +
      'at the edge of an ocean that stretches to the horizon. ' +
      'Waves crash against the shore.',
      :Winter => 'You are paddling through shallow water, ' +
      'at the edge an ocean that stretches to the horizon. ' +
      'Violent waves crash against the shore, sending up a spray of salt water.'
    },
    
    :deep_sea =>
    {:id => 152,
      :class => :deep_water,
      :ap => {:swimming => 4},
      :altitude => 0,
      :actions => [:fill],
      :image => 'p_ocean.jpg',
      
      :Spring => 'You are swimming in the ocean. ' +
      'Animals are hiding behind the rocks (except the little fish).',
      :Summer => 'You are swimming in the ocean. ' +
      'The cool water brings relief from the heat of the sun.',
      :Autumn => 'You are swimming in the ocean.',
      :Winter => 'You are swimming in the ocean. ' +
      'The cold water chills you to the bone.'
    },
    
    :thick_forest =>
    {:id => 6,
      :ap => {:forest_walk => 2, :default => 3},
      :altitude => 0,
      :class => :forest,
      :build_small? => true,
      :image => 'p_denseforest.jpg',
      :actions => [:chop_tree],
      :search => {:stick => 25, :staff => 8, :bark => 10, :chestnut => 15},
      :Spring => 'You are in a dense forest. Almost no light can be seen through the thick tree cover overhead.',
      :Summer => 'You are in a dense forest. Almost no light can be seen through the thick tree cover overhead.',
      :Autumn => 'You are in a dense forest. The thick tree cover overhead is russet and gold in colour.',
      :Winter => 'You are in a dense forest. The bare branches form a thick tangle overhead.',
    },
    
    :woodland =>
    {:id => 7,
      :ap => 1,
      :xp => 0.1,
      :altitude => 0,
      :class => :forest,
      :transition => :forest,
      :build_small? => true,
      :transition_odds => {:default => 0, :Spring => 15, :Summer => 30},
      :image => 'p_lightforest.jpg',
      :actions => [:chop_tree],
      :search => {:stick => 25, :staff => 8, :bark => 10, :chestnut => 15},
      :Spring => 'You are walking though an open woodland.',
      :Summer => 'You are walking though an open woodland.',
      :Autumn => 'You are walking though an open woodland, the leaves turning golden and brown with autumn.',
      :Winter => 'You are walking though an open woodland. The tree branches are bare.',
    },
    
    :dirt_track =>
    {:id => 8,
      :ap => 0.5,
      :altitude => 0,
      :restore_odds => 0,
      :class => :open,
      :transition => :grassland,
      :transition_odds => 20,
      :build_small? => true,
      
      :image => 'p_dirt.jpg',
      :Spring => 'You are standing on bare dirt; the muddy ground here has seen the passage of many feet.',
      :Summer => 'You are standing on bare dirt; the dusty ground here has seen the passage of many feet.',
      :Autumn => 'You are standing on bare dirt; the muddy ground here has seen the passage of many feet.',
      :Winter => 'You are standing on bare dirt; the frozen ground here has seen the passage of many feet.',
    },
    
    :empty_field =>
    {:id => 9,
      :ap => 1,
      :altitude => 0, 
      :image => 'p_efield.jpg',
      :restore_odds => 0,
      :actions => [:sow],
      :class => :field,
      :transition => :grassland,
      :transition_odds => {:default => 0, :Summer => 30},
      :Spring => 'You are standing in a ploughed field. The soil has been turned up, leaving a number of shallow furrows.',
      :Summer => 'You are standing in a ploughed field. The soil has been turned up, leaving a number of shallow furrows.',
      :Autumn => 'You are standing in a ploughed field. The soil has been turned up, leaving a number of shallow furrows.',
      :Winter => 'You are standing in a ploughed field. The soil has been turned up, leaving a number of shallow furrows.', 
    }, 
    
    :wheat_field =>
    {:id => 91,
      :ap => 1,
      :altitude => 0,
      :restore_odds => 0, 
      :image => {:Summer => 'p_sfield.jpg', :Autumn => 'p_afield.jpg', :default => 'p_efield.jpg'},
      :actions => [:harvest, :water],
      :class => :open,
      :transition => :empty_field,
      :transition_odds => {:default => 0, :Winter => 100},
      :Spring => 'You are standing in a ploughed field. It looks like something was recently planted here, though nothing has grown yet.',
      :Summer => 'You are standing in a field. Wheat is growing here, green and unripe.',
      :Autumn => 'You are standing in a field. Ripe, golden wheat stalks are waving in the breeze.',
      :Winter => 'It looks like there was a crop growing in this field, but it was left unharvested and has rotted.',
    },
    
    :marsh =>
    {:id => 10,
      :class => :wetland,
      :ap => 1.5,
      :xp => 0.15,
      :altitude => 0, 
      :image => 'p_marsh.jpg',
      :Spring => 'You are wading through a marsh.',
      :Summer => 'You are wading through a marsh.',
      :Autumn => 'You are wading through a marsh. You can barely see anything through the thick Autumn mist.',
      :Winter => 'You are wading through a marsh.'
    },
    
    :rocky_flat =>
    {
      :id => 11,
      :class => :open,
      :ap => 1,
      :altitude => 0,
      :build_small? => true,
      :build_large? => true, 
      :image => 'p_lightgrey.jpg',
      :search => {:stone => 10, :flint => 15},
      
      :Spring => 'This area is almost devoid of vegetation, with many rocks scattered around.',
      :Summer => 'This area is almost devoid of vegetation, with many rocks scattered across the dusty ground.',
      :Autumn => 'This area is almost devoid of vegetation, with many rocks scattered around.',
      :Winter => 'This area is almost devoid of vegetation, with many rocks scattered around. A cold wind howls through the desolate landscape.'
    },
    
    :cliff_bottom =>
    {
      :id => 110,
      :class => :open,
      :ap => 1.5,
      :altitude => 0, 
      :image => 'p_grey.jpg',
      :search => {:stone => 10, :flint => 15},
      :actions => [:quarry],
      
      :description => 'You are standing at the bottom of a cliff. Many large boulders, broken free from the rock face, are lying around.',
    },
    
    :low_cliff_face =>
    {
      :id => 111,
      :class => :cliff,
      :ap => {:mountaineering => 5},
      :altitude => 1, 
      :image => 'p_rshore.jpg',
      
      :description => 'You are clinging to the side of a cliff, at low elevation.'
    },
    
    
  },
  
  :weapon_class =>
  {
    :blunt => 
    {
      :hit_msg => "$ACTOR cudgeled $TARGET with a ", 
      :miss_msg => "$ACTOR swung at $TARGET with a ",
    },
    
    :slash => 
    {
      :hit_msg => "$ACTOR slashed $TARGET with a ", 
      :miss_msg => "$ACTOR swiped at $TARGET with a ",
    },
    
    :stab => 
    {
      :hit_msg => "$ACTOR stabbed $TARGET with a ", 
      :miss_msg => "$ACTOR lunged at $TARGET with a ",
    },
  }
}

Image_Folder = 'images/'
Max_Hunger = 12
AP_Recovery = 3.0
Max_AP = 100
Max_Weight = 70
Max_Items = 1000
Max_HP = 50
Max_Level = 17
Search_Dmg_Chance = 0.15 # percentage chance of reducing a tile's hp when an item is found)
Food_Rot_Chance = 0.04
