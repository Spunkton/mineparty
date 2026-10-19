# Floor star
summon block_display ~ ~ ~ {Tags:["diamond_indicator","tile_indicator","floor"],brightness:{sky:15,block:15},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-1.5f,0f,-1.4995f],scale:[0.125f,0.1251f,3.001f]},block_state:{id:"minecraft:diamond_block"}}
summon block_display ~ ~ ~ {Tags:["diamond_indicator","tile_indicator","floor"],brightness:{sky:15,block:15},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[1.375f,0f,-1.4995f],scale:[0.125f,0.1251f,3.001f]},block_state:{id:"minecraft:diamond_block"}}
summon block_display ~ ~ ~ {Tags:["diamond_indicator","tile_indicator","floor"],brightness:{sky:15,block:15},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-1.4995f,0f,-1.5f],scale:[3f,0.125f,0.125f]},block_state:{id:"minecraft:diamond_block"}}
summon block_display ~ ~ ~ {Tags:["diamond_indicator","tile_indicator","floor"],brightness:{sky:15,block:15},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-1.4995f,0f,1.375f],scale:[3f,0.125f,0.125f]},block_state:{id:"minecraft:diamond_block"}}

# Rotate that edge 45 degrees
execute as @e[tag=floor] at @s run tp @s ~ ~ ~ ~45 ~

# Second floor star
summon block_display ~ ~ ~ {Tags:["diamond_indicator","tile_indicator","floor"],brightness:{sky:15,block:15},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-1.5f,0f,-1.4995f],scale:[0.125f,0.1301f,3.001f]},block_state:{id:"minecraft:diamond_block"}}
summon block_display ~ ~ ~ {Tags:["diamond_indicator","tile_indicator","floor"],brightness:{sky:15,block:15},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[1.375f,0f,-1.4995f],scale:[0.125f,0.1301f,3.001f]},block_state:{id:"minecraft:diamond_block"}}
summon block_display ~ ~ ~ {Tags:["diamond_indicator","tile_indicator","floor"],brightness:{sky:15,block:15},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-1.4995f,0f,-1.5f],scale:[3f,0.130f,0.125f]},block_state:{id:"minecraft:diamond_block"}}
summon block_display ~ ~ ~ {Tags:["diamond_indicator","tile_indicator","floor"],brightness:{sky:15,block:15},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-1.4995f,0f,1.375f],scale:[3f,0.130f,0.125f]},block_state:{id:"minecraft:diamond_block"}}

execute as @e[tag=diamond_indicator] at @s run data modify entity @s teleport_duration set value 4