# The big one
summon block_display ~ ~ ~ {Tags:["diamond_indicator","tile_indicator","main_diamond"],brightness:{sky:15,block:15},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-1.5f,10f,-1.5f],scale:[3f,3f,3f]},block_state:{id:"minecraft:diamond_block"}}

execute as @e[tag=diamond_indicator] at @s run data modify entity @s teleport_duration set value 4