# @s is player that landed
# Executed at the tile

# Check if there is a tag filter
execute store result score #fail_check mineparty run data get entity @n[tag=tile,tag=landed_on] data.special.redirect.tag

# Teleport
execute if score #fail_check mineparty matches 0 run function mineparty:map/tiles/function/redirect/teleport with entity @n[tag=tile,tag=landed_on] data
execute unless score #fail_check mineparty matches 0 run function mineparty:map/tiles/function/redirect/teleport_with_tag with entity @n[tag=tile,tag=landed_on] data.special.redirect
execute at @s run function mineparty:game/tiles/occupy
execute at @s run particle minecraft:end_rod ~ ~ ~ 0.2 0 0.2 0.1 30
particle minecraft:end_rod ~ ~ ~ 0.2 0 0.2 0.1 30

# Notif
tellraw @s "You were teleported!"
execute at @s run tellraw @a[distance=.1..] ["",{"selector":"@s"}," was teleported!"]

# Effects
function mineparty:music/play {song:"tiles/redirect"}

# Run ending command
schedule function mineparty:command_queue 3s