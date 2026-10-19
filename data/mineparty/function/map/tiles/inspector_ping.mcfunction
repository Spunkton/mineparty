# Summon raycast to find nearest to vision (executed as player inspecting)

# Tag self
tag @s add self

# Reset scoreboard first tho
scoreboard players reset * raycast

# Summon raycast (expensive bc it's not a ticking function)
execute anchored eyes run function mineparty:other/summon_raycast_expensive
# Tile closest to the most ray points should be closest to the line overall
execute at @e[tag=ray] run scoreboard players add @n[tag=!invisible,tag=tile,distance=..3] raycast 1
scoreboard players operation #highest raycast > * raycast

# Cancel function if no tiles found
execute if score #highest raycast matches 0 run title @s actionbar "\u00a7cNo tile found."
#execute if score #highest raycast matches 0 run stopsound @s * minecraft:block.amethyst_block.resonate
execute if score #highest raycast matches 0 run playsound minecraft:block.note_block.bass player @s ~ ~ ~ 0.5 1
execute if score #highest raycast matches 0 run kill @e[tag=ray]
execute if score #highest raycast matches 0 run return 0

# Ping tile
execute as @e[tag=tile] if score @s raycast = #highest raycast at @s run tag @s add inspected

# Glowing border
execute at @n[tag=inspected] run kill @e[tag=ping_indicator,distance=..2]
execute at @n[tag=inspected] run playsound minecraft:block.note_block.chime player @a ~ ~0.5 ~ 1 1 0.2
execute at @n[tag=inspected] run summon area_effect_cloud ~ ~ ~ {custom_particle:{type:"block",block_state:"minecraft:air"},Radius:1.5f,Duration:20,Tags:["ping_indicator"],Passengers:[{id:"minecraft:block_display",Glowing:1b,brightness:{sky:15,block:15},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[1.4375f,-0.5f,-1.5f],scale:[0.0625f,0.0625f,3f]},Tags:["ping_indicator","needs_vehicle"],glow_color_override:8439583,block_state:{id:"minecraft:lime_wool"}},{id:"minecraft:block_display",Glowing:1b,brightness:{sky:15,block:15},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-1.5f,-0.5f,-1.5f],scale:[0.0625f,0.0625f,3f]},Tags:["ping_indicator","needs_vehicle"],glow_color_override:8439583,block_state:{id:"minecraft:lime_wool"}},{id:"minecraft:block_display",Glowing:1b,brightness:{sky:15,block:15},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-1.5f,-0.5f,1.4375f],scale:[3f,0.0625f,0.0625f]},Tags:["ping_indicator","needs_vehicle"],glow_color_override:8439583,block_state:{id:"minecraft:lime_wool"}},{id:"minecraft:block_display",Glowing:1b,brightness:{sky:15,block:15},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-1.5f,-0.5f,-1.5f],scale:[3f,0.0625f,0.0625f]},Tags:["ping_indicator","needs_vehicle"],glow_color_override:8439583,block_state:{id:"minecraft:lime_wool"}}]}

# Clean up
kill @e[tag=ray]
tag @s remove self
tag @e[tag=tile] remove inspected