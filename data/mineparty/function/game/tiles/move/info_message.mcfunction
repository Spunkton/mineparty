# Message in actionbar to notify about tiles

# Reset glowing
execute as @e[type=item_display,tag=special_link_indicator] run data modify entity @s Glowing set value false

# If tile would end turn
execute if entity @n[distance=0...2,tag=no_passage_temp] run title @s actionbar [{"color":"gold","text":"WARNING: Landing on this tile will end your turn!"},{"color":"yellow","text":" (Steps left: "},{"color":"white","score":{"name":"#steps","objective":"mineparty"}},{"color":"yellow","text":")"}]
execute if entity @n[distance=0...2,tag=no_passage_temp] run particle dust{color:[1.000,0.750,0.000],scale:3} ~ ~1.5 ~ 0 0 0 1 0 normal

# Key tile
execute if entity @n[distance=0...2,tag=special_link,tag=move_to_key,tag=!impassable] run title @s actionbar [{"color":"white","text":"This tile will use up your key!"},{"color":"yellow","text":" (Steps left: "},{"color":"white","score":{"name":"#steps","objective":"mineparty"}},{"color":"yellow","text":")"}]
execute if entity @n[distance=0...2,tag=special_link,tag=move_to_key,tag=impassable] run title @s actionbar [{"color":"red","text":"You need a key for this tile!"},{"color":"yellow","text":" (Steps left: "},{"color":"white","score":{"name":"#steps","objective":"mineparty"}},{"color":"yellow","text":")"}]
execute if entity @n[distance=0...2,tag=special_link,tag=move_to_key] run data modify entity @n[tag=special_link_indicator,distance=..3] Glowing set value true

# Super key tile
execute if entity @n[distance=0...2,tag=special_link,tag=move_to_super_key,tag=!impassable] run title @s actionbar [{"color":"white","text":"This tile will use up your super key!"},{"color":"yellow","text":" (Steps left: "},{"color":"white","score":{"name":"#steps","objective":"mineparty"}},{"color":"yellow","text":")"}]
execute if entity @n[distance=0...2,tag=special_link,tag=move_to_super_key,tag=impassable] run title @s actionbar [{"color":"red","text":"You need a SUPER KEY for this tile!"},{"color":"yellow","text":" (Steps left: "},{"color":"white","score":{"name":"#steps","objective":"mineparty"}},{"color":"yellow","text":")"}]
execute if entity @n[distance=0...2,tag=special_link,tag=move_to_super_key] run data modify entity @n[tag=special_link_indicator,distance=..3] Glowing set value true

# Toll tile
execute if entity @n[distance=0...2,tag=move_to_toll,tag=!impassable] run title @s actionbar [{"color":"gold","text":"WARNING: Passing this tile costs "},{"entity":"@n[distance=0...2,tag=move_to_toll]","nbt":"data.temp.tile_check.amount"}," gold!",{"color":"yellow","text":" (Steps left: "},{"color":"white","score":{"name":"#steps","objective":"mineparty"}},{"color":"yellow","text":")"}]
execute if entity @n[distance=0...2,tag=move_to_toll,tag=impassable] run title @s actionbar [{"color":"red","text":"You need to have at least "},{"entity":"@n[distance=0...2,tag=move_to_toll]","nbt":"data.temp.tile_check.amount"}," gold to pass this tile!",{"color":"yellow","text":" (Steps left: "},{"color":"white","score":{"name":"#steps","objective":"mineparty"}},{"color":"yellow","text":")"}]
execute if entity @n[distance=0...2,tag=move_to_toll] run data modify entity @n[tag=special_link_indicator,distance=..3] Glowing set value true

# Barrier tile
execute if entity @n[distance=0...2,tag=move_to_barrier,tag=impassable] run title @s actionbar [{"color":"red","text":"You need to have at least "},{"entity":"@n[distance=0...2,tag=move_to_barrier,tag=impassable]","nbt":"data.temp.tile_check.amount"}," steps left to pass this tile!",{"color":"yellow","text":" (Steps left: "},{"color":"white","score":{"name":"#steps","objective":"mineparty"}},{"color":"yellow","text":")"}]
execute if entity @n[distance=0...2,tag=move_to_barrier,tag=impassable] run data modify entity @n[tag=special_link_indicator,distance=..3] Glowing set value true

#$execute if entity @n[distance=0...2,tag=move_to,tag=diamond] run particle trail{color:[0.800,1.000,1.000],target:[$(x),$(y),$(z)],duration:20} ~ ~0.2 ~ 1 0 1 0 2 normal