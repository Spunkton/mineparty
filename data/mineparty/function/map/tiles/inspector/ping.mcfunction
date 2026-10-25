# Summon raycast to find nearest to vision (executed as player inspecting)

# Select tile looked at
### Summon raycast
execute anchored eyes run function mineparty:other/raycast/expensive {length:128}
### Select closest tile
execute at @n[tag=ray] run tag @n[tag=tile,distance=..3] add selected
### Clean up
kill @n[tag=ray]

# Glowing border
execute at @n[tag=selected] run kill @e[tag=ping_indicator,distance=..2]
execute at @n[tag=selected] run playsound minecraft:block.note_block.chime player @a ~ ~0.5 ~ 1 1 0.2
execute at @n[tag=selected] run summon area_effect_cloud ~ ~ ~ {custom_particle:{type:"block",block_state:"minecraft:air"},Radius:1.5f,Duration:20,Tags:["ping_indicator"],Passengers:[{id:"minecraft:block_display",Glowing:1b,brightness:{sky:15,block:15},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[1.4375f,-0.5f,-1.5f],scale:[0.0625f,0.0625f,3f]},Tags:["ping_indicator","needs_vehicle"],glow_color_override:8439583,block_state:{id:"minecraft:lime_wool"}},{id:"minecraft:block_display",Glowing:1b,brightness:{sky:15,block:15},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-1.5f,-0.5f,-1.5f],scale:[0.0625f,0.0625f,3f]},Tags:["ping_indicator","needs_vehicle"],glow_color_override:8439583,block_state:{id:"minecraft:lime_wool"}},{id:"minecraft:block_display",Glowing:1b,brightness:{sky:15,block:15},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-1.5f,-0.5f,1.4375f],scale:[3f,0.0625f,0.0625f]},Tags:["ping_indicator","needs_vehicle"],glow_color_override:8439583,block_state:{id:"minecraft:lime_wool"}},{id:"minecraft:block_display",Glowing:1b,brightness:{sky:15,block:15},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-1.5f,-0.5f,-1.5f],scale:[3f,0.0625f,0.0625f]},Tags:["ping_indicator","needs_vehicle"],glow_color_override:8439583,block_state:{id:"minecraft:lime_wool"}}]}

# If sneaking
execute if predicate mineparty:sneaking run function mineparty:editor/tools/map_editor/ping

# Clean up
tag @e[tag=tile] remove selected