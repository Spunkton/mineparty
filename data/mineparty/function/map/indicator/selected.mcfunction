# Summon raycast to find nearest to vision (executed as player editing)

# Tag self
tag @s add self

# Reset scoreboard first tho
scoreboard players reset * raycast

# Summon raycast
execute anchored eyes run function mineparty:other/summon_raycast
# Tile pointed to the most ray points should be pointed to the line overall
execute at @e[type=marker,tag=ray] run scoreboard players add @n[type=marker,tag=tile,distance=..3] raycast 1
scoreboard players operation #highest raycast > * raycast

# Cancel function if no tiles found
execute if score #highest raycast matches 0 run kill @e[type=marker,tag=ray]
execute if score #highest raycast matches 0 run tag @s remove self
execute if score #highest raycast matches 0 run return 0

# Give tag
execute as @e[type=marker,tag=tile] if score @s raycast = #highest raycast at @s run tag @s add pointed_candidate
tag @n[tag=pointed_candidate] add pointed
tag @n[tag=!pointed] remove pointed_candidate

# Show data
execute if items entity @s weapon.mainhand *[minecraft:custom_data~{tile_brush:true}|minecraft:custom_data~{start_marker:true}] run function mineparty:map/indicator/selected/data with entity @n[tag=pointed_candidate] data
execute if items entity @s weapon.mainhand *[minecraft:custom_data~{tile_editor:true}] unless predicate mineparty:sneaking run function mineparty:map/indicator/selected/data_detailed with entity @n[tag=pointed_candidate] data
execute if items entity @s weapon.mainhand *[minecraft:custom_data~{tile_editor:true}] if predicate mineparty:sneaking run function mineparty:map/indicator/selected/specific_check with entity @n[tag=pointed_candidate] data
execute if items entity @s weapon.mainhand *[minecraft:custom_data~{tag_editor:true}] as @n[tag=pointed_candidate] run function mineparty:map/indicator/selected/tags

# Warnings
execute unless data entity @n[tag=pointed_candidate] data.links[] run title @s actionbar "\u00a7c!!! This tile is a dead end !!!"

# Clean up
kill @e[type=marker,tag=ray]
tag @s remove self
tag @e[type=marker,tag=tile] remove pointed_candidate