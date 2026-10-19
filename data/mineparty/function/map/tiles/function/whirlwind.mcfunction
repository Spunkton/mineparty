# @s is player that landed
function mineparty:map/tiles/function/whirlwind/teleport with entity @n[tag=tile,tag=landed_on] data
execute at @s run function mineparty:game/tiles/occupy
execute at @s run particle minecraft:end_rod ~ ~ ~ 0.2 0 0.2 0.1 30
particle minecraft:end_rod ~ ~ ~ 0.2 0 0.2 0.1 30

# Notif
tellraw @s "You teleported away!"
execute at @s run tellraw @a[distance=.1..] ["",{"selector":"@s"}," teleported away!"]

# Effects
function mineparty:music/play {song:"tiles/whirlwind"}

# Run ending command
schedule function mineparty:command_queue 3s