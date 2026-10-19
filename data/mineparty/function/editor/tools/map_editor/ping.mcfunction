# Add selected tag tile you're looking at
function mineparty:editor/tag_selected

# Cancel if no tiles are selected
execute unless entity @n[tag=selected] run title @s actionbar {"color":"red","text":"No tiles selected."}
execute unless entity @n[tag=selected] run return 0

# Tag others with the same map id
execute if predicate mineparty:sneaking run function mineparty:editor/tools/map_editor/tag_same_map_and_type with entity @n[tag=selected] data
execute unless predicate mineparty:sneaking run function mineparty:editor/tools/map_editor/tag_same_map with entity @n[tag=selected] data
execute at @e[type=marker,tag=ping] run kill @e[tag=ping_indicator,distance=..2]
execute at @e[type=marker,tag=ping] run summon area_effect_cloud ~ ~ ~ {custom_particle:{type:"block",block_state:"minecraft:air"},Radius:1.5f,Duration:20,Tags:["ping_indicator"],Passengers:[{id:"minecraft:block_display",Glowing:1b,brightness:{sky:15,block:15},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[1.4375f,-0.5f,-1.5f],scale:[0.0625f,0.0625f,3f]},Tags:["ping_indicator","needs_vehicle"],glow_color_override:8439583,block_state:{id:"minecraft:lime_wool"}},{id:"minecraft:block_display",Glowing:1b,brightness:{sky:15,block:15},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-1.5f,-0.5f,-1.5f],scale:[0.0625f,0.0625f,3f]},Tags:["ping_indicator","needs_vehicle"],glow_color_override:8439583,block_state:{id:"minecraft:lime_wool"}},{id:"minecraft:block_display",Glowing:1b,brightness:{sky:15,block:15},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-1.5f,-0.5f,1.4375f],scale:[3f,0.0625f,0.0625f]},Tags:["ping_indicator","needs_vehicle"],glow_color_override:8439583,block_state:{id:"minecraft:lime_wool"}},{id:"minecraft:block_display",Glowing:1b,brightness:{sky:15,block:15},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-1.5f,-0.5f,-1.5f],scale:[3f,0.0625f,0.0625f]},Tags:["ping_indicator","needs_vehicle"],glow_color_override:8439583,block_state:{id:"minecraft:lime_wool"}}]}


# Remove selected tag
tag @e[type=marker,tag=tile,tag=selected] remove selected
tag @e[type=marker,tag=tile,tag=ping] remove ping