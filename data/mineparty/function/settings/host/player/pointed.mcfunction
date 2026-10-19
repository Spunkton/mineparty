# Find a player to point at

# Reset scoreboard first tho
scoreboard players reset * raycast

# Summon raycast
execute anchored eyes run function mineparty:other/summon_raycast
# Tile closest to the most ray points should be closest to the line overall
execute at @e[type=marker,tag=ray] positioned ~ ~-1 ~ run scoreboard players add @p[distance=..2,sort=nearest,gamemode=!spectator] raycast 1
kill @e[type=marker,tag=ray]
scoreboard players operation #highest raycast > * raycast

# Cancel function if no player found
execute if score #highest raycast matches 0 run function mineparty:settings/host/player/menu
execute if score #highest raycast matches 0 run return 0

# Tag pointed
execute as @a if score @s raycast = #highest raycast at @s run tag @s add host_pointed

# Open dialog for that person
function mineparty:settings/host/player/dialog with entity @p[tag=host_pointed]

# Clean up
kill @n[tag=player_data]
tag @a remove host_pointed