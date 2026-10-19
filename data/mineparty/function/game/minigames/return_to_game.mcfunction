# Returns back to main game

# Teleport everyone to their spots
execute as @a at @s run function mineparty:game/tiles/tp_to_occupied with entity @s
tp @p[tag=host,tag=not_playing] @r[tag=!not_playing]
tp @n[tag=helper] @p[tag=host]

# Set spawns
execute as @a[tag=!not_playing] at @n[tag=world_spawn] run spawnpoint @s
execute as @a[tag=!not_playing] run function mineparty:game/tiles/occupy/set_spawn with entity @s

# Set gamemode to adventure
gamemode adventure @a[tag=!not_playing]

# Give gold
function mineparty:game/minigames/prize

# Tell everyone theyre going back
tellraw @a "Returning to map..."

# Set scoreboard display
scoreboard objectives setdisplay sidebar mineparty_score

# Next command!
schedule function mineparty:command_queue 3s