# @s is player that landed
function mineparty:other/pick_from_list {input:"storage mineparty:main tiles.dice.list",output:"storage mineparty:main tiles.dice.command"}
function mineparty:command with storage mineparty:main tiles.dice

# Notif
tellraw @s "You received a random die!"
tellraw @a[distance=.1..] ["",{"selector":"@s"}," received a random die!"]

# Effects
function mineparty:music/play {song:"tiles/dice"}

# Run ending command
schedule function mineparty:command_queue 3s