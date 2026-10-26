# Runs the game-specific cancel function
function mineparty:minigames/cancel/from_data with storage mineparty:main

# Cancel lobby schedule
schedule clear mineparty:minigames/wait_for_ready
tag @a remove ready
execute as @a run trigger ready set 0

# No longer playing minigame
data remove storage mineparty:main playing_minigame

# Give stuff back
execute as @a[tag=!not_playing] at @s run function mineparty:minigames/items/return

# Unlobotomise helper
data modify entity @n[tag=helper] NoAI set value false
