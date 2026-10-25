# Auto-link when new tile is spawned
execute at @n[tag=new,tag=tile] as @p[predicate=mineparty:editor/holding_tile_spawner] if items entity @s weapon.mainhand *[minecraft:custom_data~{tile_spawner:true}] at @s run data modify entity @n[tag=!new,tag=tile] data.links append value {UUID:[I;1,1,1,1]}
execute at @n[tag=new,tag=tile] as @p[predicate=mineparty:editor/holding_tile_spawner] if items entity @s weapon.mainhand *[minecraft:custom_data~{tile_spawner:true}] at @s run data modify entity @n[tag=!new,tag=tile] data.links[-1].UUID set from entity @n[tag=new,tag=tile] UUID

# Effects so you know where the tile will spawn
tag @e[type=item_display,tag=spawner_pointing] add no_longer_pointed
execute as @p[predicate=mineparty:editor/holding_tile_spawner,predicate=!mineparty:sneaking] at @s run function mineparty:editor/tools/tile_spawner/outline

# Function when a new tile is spawned
execute as @e[tag=new,tag=tile] at @s run function mineparty:editor/tiles/new

# Notify when auto-linking
execute as @a[predicate=mineparty:editor/holding_tile_spawner] if items entity @s weapon.mainhand *[minecraft:custom_data~{tile_spawner:true}] run title @s actionbar "Auto-linking is \u00a7aON"
execute as @a[predicate=mineparty:editor/holding_tile_spawner] if items entity @s weapon.offhand *[minecraft:custom_data~{tile_spawner:true}] run title @s actionbar "Auto-linking is \u00a7cOFF"

# Clean up
execute as @e[type=item_display,tag=spawner_pointing,tag=no_longer_pointed] on passengers run kill @s
kill @e[type=item_display,tag=spawner_pointing,tag=no_longer_pointed]