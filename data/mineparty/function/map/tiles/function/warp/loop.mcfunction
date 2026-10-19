# Check if moving left or right
### Check if input changed
execute as @p[tag=taking_turn,tag=!input_left] if predicate {type:"minecraft:entity_properties",entity:"this",predicate:{"minecraft:type_specific/player":{input:{left:1b}}}} run scoreboard players remove #warp minigames 1
execute as @p[tag=taking_turn,tag=!input_left] if predicate {type:"minecraft:entity_properties",entity:"this",predicate:{"minecraft:type_specific/player":{input:{left:1b}}}} run tag @s add input_update
execute as @p[tag=taking_turn,tag=!input_right] if predicate {type:"minecraft:entity_properties",entity:"this",predicate:{"minecraft:type_specific/player":{input:{right:1b}}}} run scoreboard players add #warp minigames 1
execute as @p[tag=taking_turn,tag=!input_right] if predicate {type:"minecraft:entity_properties",entity:"this",predicate:{"minecraft:type_specific/player":{input:{right:1b}}}} run tag @s add input_update
### Register input
execute as @p[tag=taking_turn] if predicate {type:"minecraft:entity_properties",entity:"this",predicate:{"minecraft:type_specific/player":{input:{left:1b}}}} run tag @s add input_left
execute as @p[tag=taking_turn] if predicate {type:"minecraft:entity_properties",entity:"this",predicate:{"minecraft:type_specific/player":{input:{right:1b}}}} run tag @s add input_right
### Unregister input
execute as @p[tag=taking_turn] if predicate {type:"minecraft:entity_properties",entity:"this",predicate:{"minecraft:type_specific/player":{input:{left:0b}}}} run tag @s remove input_left
execute as @p[tag=taking_turn] if predicate {type:"minecraft:entity_properties",entity:"this",predicate:{"minecraft:type_specific/player":{input:{right:0b}}}} run tag @s remove input_right

### Modulo #(amount of warp tiles)
execute if score #warp minigames matches ..-1 run scoreboard players operation #warp minigames += #warp_count minigames
execute if score #warp minigames >= #warp_count minigames run scoreboard players set #warp minigames 0

# Teleport everyone
execute as @e[tag=tile,tag=warp] if score #warp minigames = @s minigames at @s run tp @n[tag=warp_display] ~ ~ ~

# Effects if moved
execute as @p[tag=taking_turn,tag=input_update] at @s run playsound minecraft:entity.strider.ambient player @s ~ ~ ~ 1 1.2 1
execute as @p[tag=taking_turn,tag=input_update] at @s run playsound minecraft:entity.ender_eye.death player @s ~ ~ ~ 1 1.2 1
execute at @p[tag=taking_turn,tag=input_update] run particle minecraft:end_rod ~ ~ ~ 0.2 0 0.2 0.1 32 force

# Notify stuff
title @p[tag=taking_turn] actionbar "Dismount to warp to this tile"

# Remove update
tag @p[tag=taking_turn] remove input_update

# Schedule self
execute as @p[tag=taking_turn] unless predicate mineparty:sneaking run return run schedule function mineparty:map/tiles/function/warp/loop 1t

# Dismount
ride @p[tag=taking_turn] dismount

# Occupy new tile
execute as @p[tag=taking_turn] at @s run function mineparty:game/tiles/occupy

# Effects
execute at @p[tag=taking_turn] run particle minecraft:end_rod ~ ~ ~ 0.2 0 0.2 0.1 32
execute at @p[tag=taking_turn] run particle minecraft:witch ~ ~ ~ 0.5 0 0.5 0.2 64
execute as @p[tag=taking_turn] at @s run playsound minecraft:entity.strider.happy player @s ~ ~ ~ 1 1.2 1
execute as @p[tag=taking_turn] at @s run playsound minecraft:item.chorus_fruit.teleport player @s ~ ~ ~ 0.6 1.2 0.6
### Jingle
function mineparty:music/play {song:"tiles/warp/finished"}

# Notif
tellraw @p[tag=taking_turn] "You bid the Strider farewell..."
tellraw @a[tag=!taking_turn] ["",{"selector":"@s"}," finished warping."]

# Clean up
title @p[tag=taking_turn] actionbar ""
tag @p[tag=taking_turn] remove input_left
tag @p[tag=taking_turn] remove input_right
tag @e[tag=tile,tag=warp] remove warp
tp @n[tag=warp_display] 0 -100 0
kill @e[tag=warp_vehicle]
kill @e[tag=warp_indicator]
scoreboard players reset * minigames

# Run ending command
schedule function mineparty:command_queue 3s