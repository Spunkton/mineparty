# Ends the minigame and returns to whatever the previous game stuff was

# No longer playing minigame
data remove storage mineparty:main playing_minigame

# Give stuff back
execute as @a[tag=!not_playing] at @s run function mineparty:minigames/items/return

# Unlobotomise helper
data modify entity @n[tag=helper] NoAI set value false

# Notify ranks
function mineparty:minigames/results

# Next command!
function mineparty:command_queue