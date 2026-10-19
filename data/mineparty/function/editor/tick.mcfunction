# Auto-link when new tile is spawned
execute at @n[tag=new,tag=tile] as @p[predicate=mineparty:editor/holding_tile_spawner] if items entity @s weapon.mainhand *[minecraft:custom_data~{tile_spawner:true}] at @s run data modify entity @n[tag=!new,tag=tile] data.links append value {UUID:[I;1,1,1,1]}
execute at @n[tag=new,tag=tile] as @p[predicate=mineparty:editor/holding_tile_spawner] if items entity @s weapon.mainhand *[minecraft:custom_data~{tile_spawner:true}] at @s run data modify entity @n[tag=!new,tag=tile] data.links[-1].UUID set from entity @n[tag=new,tag=tile] UUID

# Effects so you know which are linked
execute at @n[tag=new,tag=tile] as @p[predicate=mineparty:editor/holding_tile_spawner] if items entity @s weapon.mainhand *[minecraft:custom_data~{tile_spawner:true}] run particle minecraft:witch ~ ~1 ~ 0 0 0 0.001 16

# Function when a new tile is spawned
execute as @e[tag=new,tag=tile] at @s run function mineparty:editor/tiles/new_tile

# Notify when auto-linking
execute as @a[predicate=mineparty:editor/holding_tile_spawner] if items entity @s weapon.mainhand *[minecraft:custom_data~{tile_spawner:true}] run title @s actionbar "Auto-linking is \u00a7aON"
execute as @a[predicate=mineparty:editor/holding_tile_spawner] if items entity @s weapon.offhand *[minecraft:custom_data~{tile_spawner:true}] run title @s actionbar "Auto-linking is \u00a7cOFF"