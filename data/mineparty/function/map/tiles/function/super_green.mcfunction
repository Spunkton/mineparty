# @s is player that landed
clear @s *[custom_data~{debt:true}]
function mineparty:game/items/gold/give {amount:10}

# Notif
tellraw @s "You gained \u00a7610\u00a7r gold! Yowza!"
tellraw @a[distance=.1..] ["",{"selector":"@s"}," gained \u00a7610\u00a7r gold! Yowza!"]

# Effects
function mineparty:music/play {song:"tiles/green"}
summon item ~ ~ ~ {Age:5960,PickupDelay:32767,Motion:[-0.4,-0.4,-0.4],Item:{id:"minecraft:gold_ingot",count:1}}
summon item ~ ~ ~ {Age:5960,PickupDelay:32767,Motion:[0.4,-0.4,-0.4],Item:{id:"minecraft:gold_ingot",count:1}}
summon item ~ ~ ~ {Age:5960,PickupDelay:32767,Motion:[0,-0.4,0.6],Item:{id:"minecraft:gold_ingot",count:1}}
summon item ~ ~ ~ {Age:5960,PickupDelay:32767,Motion:[0.2,0.2,0.2],Item:{id:"minecraft:gold_ingot",count:1}}
summon item ~ ~ ~ {Age:5960,PickupDelay:32767,Motion:[-0.2,0.2,0.2],Item:{id:"minecraft:gold_ingot",count:1}}
summon item ~ ~ ~ {Age:5960,PickupDelay:32767,Motion:[0,0.2,-0.3],Item:{id:"minecraft:gold_ingot",count:1}}

# Run ending command
schedule function mineparty:command_queue 3s