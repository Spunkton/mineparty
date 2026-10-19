# @s is player that landed

# Check if there is a tag filter
execute store result score #fail_check mineparty run data get entity @n[tag=tile] data.special.lucky.tag

# Teleport
execute if score #fail_check mineparty matches 0 run function mineparty:map/tiles/function/lucky/teleport with entity @n[tag=tile] data
execute unless score #fail_check mineparty matches 0 run function mineparty:map/tiles/function/lucky/teleport_with_tag with entity @n[tag=tile] data.special.lucky
execute at @s run function mineparty:game/tiles/occupy
execute at @s run particle minecraft:end_rod ~ ~ ~ 0.2 0 0.2 0.1 30
particle minecraft:end_rod ~ ~ ~ 0.2 0 0.2 0.1 30
execute at @s run particle minecraft:totem_of_undying ~ ~ ~ 0 0 0 1 128
execute at @s run summon firework_rocket ~ ~ ~ {Glowing:1b,LifeTime:40,Tags:["lucky_rocket"],FireworksItem:{id:"minecraft:firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:"star",has_twinkle:true,has_trail:true,colors:[I;16711680,16776960,65280,65535,255,16711935],fade_colors:[I;11075551]}]}}}}

# Notif
tellraw @s "It's your lucky day!"
execute at @s run tellraw @a[distance=.1..] ["",{"selector":"@s"}," is in luck!"]
data modify entity @n[tag=helper] data.queue set value [["The stars have aligned for you today!"],["Oh lucky you!"]]
schedule function mineparty:game/helper/dialog/speak 2s

# Effects
scoreboard players set #lucky_animation mineparty 24
function mineparty:map/tiles/function/lucky/loop
function mineparty:music/play {song:"tiles/lucky"}

# Run ending command
schedule function mineparty:command_queue 10s