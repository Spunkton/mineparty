# @s is player that landed
function mineparty:game/items/gold/give {amount:3}

# Notif
tellraw @s "You gained \u00a763\u00a7r gold!"
tellraw @a[distance=.1..] ["",{"selector":"@s"}," gained \u00a763\u00a7r gold!"]

# Effects
function mineparty:music/play {song:"tiles/green"}
summon item ~ ~ ~ {Age:5960,PickupDelay:32767,Motion:[0.2,0.2,0.2],Item:{id:"minecraft:gold_ingot",count:1}}
summon item ~ ~ ~ {Age:5960,PickupDelay:32767,Motion:[-0.2,0.2,0.2],Item:{id:"minecraft:gold_ingot",count:1}}
summon item ~ ~ ~ {Age:5960,PickupDelay:32767,Motion:[0,0.2,-0.3],Item:{id:"minecraft:gold_ingot",count:1}}

# Run ending command
schedule function mineparty:command_queue 3s