# Needs $(game)

# Fails if game is not there
$execute unless data storage mineparty:main minigames.available[{id:"$(game)"}] run tellraw @a "\u00a7cGame not available."
$execute unless data storage mineparty:main minigames.available[{id:"$(game)"}] run return 0

# Reset ready scores
scoreboard players set @a ready 0

# Store the minigame that is running
$data modify storage mineparty:main playing_minigame set value "$(game)"

# Put away inventory
execute as @a[tag=!not_playing] at @s run function mineparty:minigames/items/store

# Set ready function
$data modify storage mineparty:main ready.command set value "function mineparty:minigames/minigames/$(game)/start"
data modify storage mineparty:main ready.sec set value 3

# Stop minigame title if there was one
schedule clear mineparty:game/minigames/title/loop
title @a reset
effect clear @a minecraft:darkness
schedule clear mineparty:music/play/bit

# Tell everybody the game is launching
$tellraw @a [{"color":"white","text":"Launching "},{"nbt":"minigames.available[{id:\"$(game)\"}].name","storage":"mineparty:main"},"..."]
$title @a subtitle {"nbt":"minigames.available[{id:\"$(game)\"}].name","storage":"mineparty:main","interpret":true}
title @a title ""

# Lobotomise helper
data modify entity @n[tag=helper] NoAI set value true

# Activate lobby function
$function mineparty:minigames/minigames/$(game)/lobby

# Activate wait_for_ready function
function mineparty:minigames/wait_for_ready