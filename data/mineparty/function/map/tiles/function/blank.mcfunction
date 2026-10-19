# @s is player that landed
tellraw @a "Nothing happens..."
function mineparty:music/play {song:"tiles/blank"}

# Run ending command
schedule function mineparty:command_queue 3s