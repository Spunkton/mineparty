# Show and remove tile indicators


# Add tags by requirement
execute as @a[predicate=mineparty:editor/holding_tile_linker] if items entity @s weapon.mainhand *[minecraft:custom_data~{tile_linker:true}] at @s run function mineparty:map/indicator/tag/pivot
execute as @a[predicate=mineparty:editor/holding_tile_linker] if items entity @s weapon.mainhand *[minecraft:custom_data~{tile_linker:true}] as @e[type=marker,tag=tile,tag=!pivot] unless data entity @s data.links[] run tag @s add dead_end
execute as @a[predicate=mineparty:editor/holding_tile_spawner] at @s if items entity @s weapon.mainhand *[minecraft:custom_data~{tile_spawner:true}] run tag @n[tag=tile] add auto_link

# Check what tile the player is selecting
execute as @a[predicate=mineparty:editor/holding_tool] at @s run function mineparty:map/indicator/selected

# Add indicators if tag
execute as @e[type=marker,tag=tile,tag=pointed] at @s unless entity @n[tag=pointed_indicator,distance=..3] run function mineparty:map/indicator/pointed
execute as @e[type=marker,tag=tile,tag=pivot] at @s unless entity @n[tag=pivot_indicator,distance=..3] run summon item_display ~ ~1 ~ {billboard:"center",Tags:["editor_indicator","pivot_indicator","tile_indicator"],item:{id:"minecraft:compass",count:1}}
execute as @e[type=marker,tag=tile,tag=link,tag=!link_key,tag=!link_super_key,tag=!link_toll,tag=!link_barrier] at @s unless entity @n[tag=link_indicator,distance=..3] run summon item_display ~ ~1 ~ {billboard:"fixed",Tags:["editor_indicator","link_indicator","tile_indicator"],item:{id:"minecraft:lodestone",count:1}}
execute as @e[type=marker,tag=tile,tag=link_key] at @s unless entity @n[tag=link_indicator,distance=..3] run summon item_display ~ ~1 ~ {billboard:"fixed",Tags:["editor_indicator","link_indicator","tile_indicator"],item:{id:"minecraft:vault",count:1}}
execute as @e[type=marker,tag=tile,tag=link_super_key] at @s unless entity @n[tag=link_indicator,distance=..3] run summon block_display ~-0.5 ~0.5 ~-0.5 {billboard:"fixed",Tags:["editor_indicator","link_indicator","tile_indicator"],block_state:{id:"minecraft:vault",properties:{ominous:"true"}}}
execute as @e[type=marker,tag=tile,tag=link_toll] at @s unless entity @n[tag=link_indicator,distance=..3] run summon item_display ~ ~1 ~ {billboard:"fixed",Tags:["editor_indicator","link_indicator","tile_indicator"],item:{id:"minecraft:gold_block",count:1}}
execute as @e[type=marker,tag=tile,tag=link_barrier] at @s unless entity @n[tag=link_indicator,distance=..3] run summon item_display ~ ~1 ~ {billboard:"fixed",Tags:["editor_indicator","link_indicator","tile_indicator"],item:{id:"minecraft:bricks",count:1}}
execute as @e[type=marker,tag=tile,tag=command_link] at @s unless entity @n[tag=command_link_indicator,distance=..3] run summon item_display ~ ~1 ~ {billboard:"fixed",Tags:["editor_indicator","command_link_indicator","tile_indicator"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,1f,0f],scale:[0.5f,0.5f,0.5f]},item:{id:"minecraft:command_block",count:1}}
execute as @e[tag=position_indicator] at @s unless entity @n[tag=tile,tag=position,distance=..3] at @e[tag=tile,tag=position] unless entity @n[tag=position_indicator,distance=..3] run tp @s ~ ~ ~
execute as @e[type=marker,tag=tile,tag=position] at @s unless entity @n[tag=position_indicator,distance=..3] run function mineparty:map/indicator/position
execute as @e[type=marker,tag=tile,tag=auto_link] at @s unless entity @n[tag=auto_link_indicator,distance=..3] run summon item_display ~ ~1 ~ {billboard:"center",Tags:["editor_indicator","auto_link_indicator","tile_indicator"],item:{id:"minecraft:lead",count:1}}
### Property indicators (tag not cleared at start of function)
execute as @e[type=marker,tag=tile,tag=start] at @s unless entity @n[tag=start_indicator,distance=..3] run summon item_display ~ ~ ~ {transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[1f,0f,0f,1f],translation:[1.25f,0f,1.875f],scale:[0.5f,0.1f,0.5f]},billboard:"fixed",Tags:["editor_indicator","start_indicator","tile_indicator","editor_indicator"],item:{id:"minecraft:beacon",count:1}}
execute as @e[type=marker,tag=tile,tag=no_passage] at @s unless entity @n[tag=no_passage_indicator,distance=..3] run summon item_display ~ ~ ~ {transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[1f,0f,0f,1f],translation:[-0.625f,0f,1.875f],scale:[0.5f,0.1f,0.5f]},billboard:"fixed",Tags:["editor_indicator","no_passage_indicator","tile_indicator","editor_indicator"],item:{id:"minecraft:bricks",count:1}}
execute as @e[type=marker,tag=tile,tag=no_diamond] at @s unless entity @n[tag=no_diamond_indicator,distance=..3] run function mineparty:map/indicator/no_diamond
execute as @e[type=marker,tag=tile,tag=no_warp] at @s unless entity @n[tag=no_warp_indicator,distance=..3] run function mineparty:map/indicator/no_warp
execute as @e[type=marker,tag=tile,tag=dead_end] at @s unless entity @n[tag=dead_end_indicator,distance=..3] run function mineparty:map/indicator/dead_end
execute as @e[type=marker,tag=tile] at @s unless entity @n[tag=tile_border_indicator,distance=..3] if entity @p[distance=..64,predicate=mineparty:editor/holding_tool] run function mineparty:map/indicator/tile

# Remove indicators if no tag
### Could probably be done with less lines but I'm lazy
execute as @e[tag=pointed_indicator] at @s unless entity @n[tag=tile,tag=pointed,distance=..3] run kill @s
execute as @e[tag=pivot_indicator] at @s unless entity @n[tag=tile,tag=pivot,distance=..3] run kill @s
execute as @e[tag=link_indicator] at @s unless entity @n[tag=tile,tag=link,distance=..3] run kill @s
execute as @e[tag=command_link_indicator] at @s unless entity @n[tag=tile,tag=command_link,distance=..3] run kill @s
execute as @e[tag=position_indicator] at @s unless entity @n[tag=tile,tag=position,distance=..3] run kill @s
execute as @e[tag=auto_link_indicator] at @s unless entity @n[tag=tile,tag=auto_link,distance=..3] run kill @s
### Property indicators
execute as @e[tag=start_indicator] at @s unless entity @n[tag=tile,tag=start,distance=..3] run kill @s
execute as @e[tag=no_passage_indicator] at @s unless entity @n[tag=tile,tag=no_passage,distance=..3] run kill @s
execute as @e[tag=no_diamond_indicator] at @s unless entity @n[tag=tile,tag=no_diamond,distance=..3] run kill @s
execute as @e[tag=no_warp_indicator] at @s unless entity @n[tag=tile,tag=no_warp,distance=..3] run kill @s
execute as @e[tag=dead_end_indicator] at @s unless entity @n[tag=tile,tag=dead_end,distance=..3] run kill @s
execute as @e[type=marker,tag=tile,tag=pointed] at @s run kill @e[tag=tile_border_indicator,distance=..3]

# Clear tags
tag @e[type=marker,tag=tile] remove pointed
tag @e[type=marker,tag=tile] remove pivot
tag @e[type=marker,tag=tile] remove link
tag @e[type=marker,tag=tile] remove special_link
tag @e[type=marker,tag=tile] remove command_link
tag @e[type=marker,tag=tile] remove unlocked
tag @e[type=marker,tag=tile] remove link_key
tag @e[type=marker,tag=tile] remove link_super_key
tag @e[type=marker,tag=tile] remove link_toll
tag @e[type=marker,tag=tile] remove link_barrier
tag @e[type=marker,tag=tile] remove position
tag @e[type=marker,tag=tile] remove dead_end
tag @e[type=marker,tag=tile] remove auto_link