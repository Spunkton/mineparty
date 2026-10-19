# Summon raycast to find player nearest to vision (executed as player inspecting)

# Reset scoreboard first tho
scoreboard players reset * raycast

# Summon raycast
execute anchored eyes run function mineparty:other/summon_raycast
# Tile closest to the most ray points should be closest to the line overall
execute at @e[type=marker,tag=ray] positioned ~ ~-1 ~ run scoreboard players add @p[distance=..2,sort=nearest,gamemode=!spectator] raycast 1
kill @e[type=marker,tag=ray]
scoreboard players operation #highest raycast > * raycast

# Cancel function if no player found
#execute if score #highest raycast matches 0 run title @s actionbar "\u00a7cNo player found."
execute if score #highest raycast matches 0 run return 0

# Tag pointed
execute as @a if score @s raycast = #highest raycast at @s run tag @s add host_pointed
#title @s actionbar [{"text":"Looking at "},{"selector":"@p[tag=host_pointed]"}]

# Particles so you know who is pointed at
execute at @n[tag=host_pointed] run particle dust{color:[1.000,0.000,0.000],scale:1} ~ ~3 ~ 0 0 0 1 0 normal @s

# Clean up
tag @a remove host_pointed