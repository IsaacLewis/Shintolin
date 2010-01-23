This is a reference for how animals, items, buildings, terrain types, and skills are represented internally. I'm posting this here for 2 reasons: firstly, it'll help people give structure to new suggestions; secondly, if people follow this guide, it makes it much easier for me to implement suggestions. Don't worry about following everything set out here to the letter, since I can change stuff as needed.

Note that database entries are of the form:

:name =>

{

:option_1 => value,

:option_2 => value,

}

Each class begins with an example containing all the required attributes. Then there is a list of optional attributes, with explanations as needed. I've left out explanations where I assume things are obvious.

[i]What's with all the colons?[/i]

Words with colons prefixed, such as :name or :option_1, are known as keywords, or symbols, and are only used internally - they won't be displayed. (Text that will be displayed usually appears between double or single quotes, eg :name => "deer").

If you are making suggestions that involve multiple new things, such as a new item that requires new skills to use, you can use keywords to link them together. Example:

You want to add sandwiches to the game. OK, first we need to add cheese:

:cheese =>

{:name => "cheese",

:weight => 1}

Then, we add sandwiches, which require two bread and one cheese to make:

:sandwich =>

{:name => "cheese sandwich",

:materials => {:bread => 2, :cheese => 1}}

[b]ANIMALS[/b]

Required values:

:deer => 

{

:name => "deer",

:plural => "deer",

:habitats => [:forest,:open],

:max_hp => 30,

:when_attacked => {:flee => 60},

:loot => {:raw_meat => 8, :pelt => 1}

},

:habitats is a list of terrain categories the animal will enter. Note that, for example, :forest includes both light, normal and thick forest. See TERRAIN for the different categories.

:when_attacked is the possible responses to an attack, by percentage. EG, a deer will flee 60% of the time. Possible values are :flee and :attack, animals may do both.

Animals that can ATTACK must include the following:

:attack_dmg => 2,

:hit_msg => "gores you with its tusk",

Animal spawn rates are defined by region. If you suggest new animals, it will help if you think of regions where they will spawn, and how common they should be.

[b]ITEMS[/b]

Required values:

:pelt =>

{

:name => 'pelt',

:plural => 'pelts',

:desc => "an animal's hide",

:weight => 4,

},

Note that max encumberance is currently set to 70.

Item search rates are defined in TERRAINs. Searchable items can include the following:

:Autumn => 0.8,

:Winter => 0.7

So, if the base chance to find a stick in a forest square is 20%, it will be 20 x 0.8 = 16% in Autumn, and 14% in Winter.

Items that can be used as weapons need the following:

:use => :weapon,

:break_odds => 10,

:accuracy => 25,

:effect => 1,

:weapon_class => :blunt,  (can be :blunt, :stab or :slash)

:effect is damage. :use can also be set to :heal, :revive, or :food. In the case of :heal and :revive, :effect is the hp healed. (:food items always restore 1 hunger, so :effect isn't required).

What if you want skills to improve the effect of an item? OK, it gets a little more complicated:

:effect => {:default => 2, :spear1 => 3, :spear3 => 4},

So, by default, a stone spear does 2 damage; with the first spear skill, :spear1, it does 3 damage; with :spear3, it does 4 damage. The same works for accuracy:

:accuracy => {:default => 30, :spear2 => 40, :spear4 => 50},

Craftable items should include the following:

:craftable => true,

:craft_ap => 6,

:craft_xp => 3,

:materials => {:hand_axe => 2, :stick => 1}

Optional craft attributes: 

:tools => [:stone_carpentry],

Unlike materials, tools are not used up, though they can break. The [] notation allows items with multiple tools, eg [:stone, :stone_axe].

:craft_amount => 6,

By default, one item is crafted at a time. :craft_amount allows multiple items to be crafted, eg, 6 sticks can be made from 1 log.

:craft_xp_type => :herbal

By default, crafting gives crafter xp; this allows other xp types to be given.

:craft_building => :campfire,

:craft_skill => :tea_making,

An example item with many attributes:

:stick =>

{

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



[b]BUILDINGS[/b]

Required attributes:

:signpost =>

{

:name => 'signpost',

:size => :small,

:floors => 0,

:max_hp => 5,

:build_ap => 20,

:build_xp => 5,

:materials => {:timber => 2},

:build_msg => "You build a signpost."

},

Size can be :small or :large; small buildings are buildable on terrain types with the :build_small? attribute set to true, and large buildings on tiles with the :build_large? attribute.

Floors can be set to 0 or 1. Buildings with 0 floors cannot be entered. (I did plan to add buildings with multiple floors, but this has not been implemented).

Optional attributes:

:tools => [:stone_carpentry],

:build_skill => :trailblazing,

:build_xp_type => :herbal,

Note that these function similarly to equivalent attributes for items.

:prereq => :longhouse2,

EG: a :hospital can only be built on a square containing a :longhouse2 (finished longhouse); a :longhouse2 can only be built on a square containing a :longhouse1 (stage one longhouse).

:settlement_level => :village,

Currently can only be set to :village. Buildings with this attribute are settlement-only.

:interior => "You are inside a large wooden building. " +
  "Various medicinal supplies are arranged here, " +
  "and dried herbs hang from the ceiling"

:ap_recovery => +0.5,

:actions => [:give, :take],

These actions will be added to the list of possible actions if a player is standing next to the building.

:unwritable => true,

Larger example:

:hospital =>

{

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

:build_msg => "You organise your medicinal supplies and establish a hospital in this building.",

:interior => "You are inside a large wooden building. " +
  "Various medicinal supplies are arranged here, " +
  "and dried herbs hang from the ceiling"

},

Note that it is not currently possible for buildings to provide a boost to items; eg, hospitals that provide better healing. This will be implemented ASAP.

Buildable terrain types, such as dirt tracks, are also included in buildings:

:dirt_track => 

{

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

The terrain given by :terrain_type must be defined in the TERRAIN section.

[b]SKILLS[/b]

OK, a simpler one now. The following is all that is required for any skill:

:artisanship =>

{

:name => 'artisanship',

:type => :crafter,

:desc => 'convert longhouses into workshops',

:prereq => :carpentry

},    

It's simple because all the 'work' done by a skill is described elsewhere. 

Skills that allow crafting of items or building of buildings should be included in the :craft_skill or :build_skill of the relevant entity.

Skills that improve the effect of an item should be included in the items :effect or :accuracy field (see ITEMS).

Skills with other in-game effects, such as triage, cannot have their behaviour defined in the database, as they require altering the game's code.

[b]TERRAINS[/b]

Required fields:


:grassland =>

{

:ap => 1,

:altitude => 0,

:image => 'p_grass.jpg',

:class => :open,

:Spring => 'You are walking through a verdant grassland. Some small flowers are starting to grow here.',

:Summer => 'You are walking through a verdant grassland, with many dandelions and other flowers. Crickets are chirping in the long grass.',

:Autumn => 'You are walking through a grassland. The cold weather is beginning to turn the grass brown.',

:Winter => 'You are walking through a grassland. Frost has hardened the ground, and there is little sign of life.',

},

:altitude is used for determining ap costs when traversing hills. For example, moving between an altitude 0 and altitude 1 tile adds 2 to the base ap cost.

:class allows terrains to be categorised - existing ones include :open, :forest, :hill, :shallow_water, :deep_water, :wetland, :cliff, :beach and :field - new ones can be easily added. Currently only used for animal habitats.

If you want AP costs to vary by skill, use the following:

:ap => {:swimming => 2, :default => 4},

If :default is not included in the list, the terrain will be impassible without the required skill. Eg, for deep water:

:ap => {:swimming => 4},

Optional attributes:

:search => {:onion => 12, :thyme => 12, :wheat => 5},

A list of items and the % chance of finding them. Note that search rates may also vary be season: see ITEMS. The :dig attribute works similarly.

:build_small? => true,

:build_large? => true,

If :build_small? is true, buildings of size :small can be built. (See BUILDINGS). Likewise for :build_large? and :large buildings.

:actions => [:dig],

Works similarly to the :actions attribute for BUILDINGS.

:ap_recovery => +0.5,

: xp => 0.2,

Travelling through some tiles may give wanderer XP. In this case, there is a 0.2 chance of receiving 1 xp when entering this square.

:transition => :thick_forest,

:transition_odds => {:default => 0, :Spring => 15, :Summer => 30},

Some terrain types have a chance of changing to another at the daytick. :transition is the type they will change into, and :transition_odds are the odds of changing by season.

If anyone has any questions, feel free to ask and I will elaborate.