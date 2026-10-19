# @s is player that landed

# Check if there is a tag filter
execute store result score #fail_check mineparty run data get entity @n[tag=tile,tag=landed_on] data.special.warp.tag

# Tag all warp tiles
function mineparty:map/tiles/function/warp/tag_warp with entity @n[tag=tile,tag=landed_on] data
execute unless score #fail_check mineparty matches 0 run function mineparty:map/tiles/function/warp/tag_warp_and_tag with entity @n[tag=tile,tag=landed_on] data.special.warp

# Reset and order scoreboard (we use the minigame one for this)
### Reset scores
scoreboard players reset * minigames
scoreboard players set @e[tag=tile,tag=warp] minigames 0
### Set total warps
execute store result score #warp_count minigames if entity @e[tag=tile,tag=warp]
### Order warps
execute as @n[tag=tile,tag=warp,tag=!ordered] at @s run function mineparty:map/tiles/function/warp/order
tag @e[tag=tile] remove ordered

# Set current warp tile
scoreboard players set #warp minigames 0

# Ride the Stride
execute at @n[tag=tile,tag=warp,scores={minigames=0}] run summon block_display ~ ~ ~ {Tags:["warp_display","warp_vehicle"],Passengers:[{id:"minecraft:strider",Silent:1b,Invulnerable:1b,Team:"no_collision",NoAI:1b,Tags:["warp_strider","warp_vehicle"],CustomName:"Jan",equipment:{saddle:{id:"minecraft:saddle",count:1}},attributes:[{id:"minecraft:max_health",base:0}]}],block_state:{id:"minecraft:air"}}
function mineparty:other/pick_from_list {input:"storage mineparty:main quips.names.dutch",output:"entity @n[tag=warp_strider] CustomName"}
ride @p[tag=taking_turn] mount @n[tag=warp_strider]

# Effects
execute at @n[tag=warp_strider] run particle minecraft:soul_fire_flame ~ ~ ~ 0.5 0 0.5 0.1 64
execute at @n[tag=warp_strider] run particle minecraft:end_rod ~ ~ ~ 0.2 0 0.2 0.1 30
execute at @n[tag=warp_strider] run playsound minecraft:entity.strider.happy player @a ~ ~ ~ 1 1.2 1
execute at @n[tag=warp_strider] run playsound minecraft:entity.ender_eye.death player @a ~ ~ ~ 1 1.2 1

# Summon indicators
execute at @e[tag=tile,tag=warp] run function mineparty:map/tiles/function/warp/indicator

# So they dont immediately teleport
tag @p[tag=taking_turn] add input_left
tag @p[tag=taking_turn] add input_right

# Start loop
function mineparty:map/tiles/function/warp/loop

# Notif
tellraw @s "You get to take a stride elsewhere..."
tellraw @s {"color":"gold","text":"Move left and right to move between tiles! Dismount to end warping."}
execute at @s run tellraw @a[distance=.1..] ["",{"selector":"@s"}," is on the move!"]

# Effects
function mineparty:music/play {song:"tiles/warp"}