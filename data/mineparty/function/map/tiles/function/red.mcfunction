#@s is player that landed
clear @s gold_ingot 3

#Notif
tellraw @s "You lost \u00a7c3\u00a7r gold..."
tellraw @a[distance=.1..] ["",{"selector":"@s"}," lost \u00a7c3\u00a7r gold..."]

#Effects
function mineparty:music/play {song:"tiles/red"}

#Run ending command
schedule function mineparty:command_queue 3s