advancement revoke @s only mineparty:map/tiles/inspector

# Summon raycast to find nearest to vision (executed as player inspecting)

# Tag self
tag @s add self

# Reset scoreboard first tho
scoreboard players reset * raycast

# Summon raycast
execute anchored eyes run function mineparty:other/summon_raycast
# Tile closest to the most ray points should be closest to the line overall
execute at @e[type=marker,tag=ray] run scoreboard players add @n[tag=tile,distance=..3] raycast 1
scoreboard players operation #highest raycast > * raycast

# Cancel function if no tiles found
execute if score #highest raycast matches 0 run title @s actionbar "\u00a7cNo tile found."
execute if score #highest raycast matches 0 run return 0

# Describe tile
execute as @e[type=marker,tag=tile] if score @s raycast = #highest raycast at @s run tag @s add inspected
function mineparty:map/tiles/description with entity @n[tag=inspected] data

# Particles so you know which one was described
execute at @n[tag=inspected] run particle dust{color:[1.000,0.000,0.000],scale:1} ~ ~ ~ 0 0 0 1 0 normal

# Clean up
kill @e[type=marker,tag=ray]
tag @s remove self
tag @e[type=marker,tag=tile] remove inspected