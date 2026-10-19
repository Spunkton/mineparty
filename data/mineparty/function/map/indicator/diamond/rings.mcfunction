# Orbiting diamonds
summon item_display ~ ~ ~ {Tags:["diamond_indicator","tile_indicator","orbit","clockwise"],brightness:{sky:15,block:15},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,11.5f,3.5f],scale:[1f,1f,1f]},item:{id:"minecraft:diamond"}}
summon item_display ~ ~ ~ {Tags:["diamond_indicator","tile_indicator","orbit","counter"],brightness:{sky:15,block:15},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,8.5f,3f],scale:[1f,1f,1f]},item:{id:"minecraft:diamond"}}
# Rotate those diamonds 45 degrees
execute as @e[tag=orbit] at @s run tp @s ~ ~ ~ ~45 ~
### Repeat that 7 times
summon item_display ~ ~ ~ {Tags:["diamond_indicator","tile_indicator","orbit","clockwise"],brightness:{sky:15,block:15},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,11.5f,3.5f],scale:[1f,1f,1f]},item:{id:"minecraft:diamond"}}
summon item_display ~ ~ ~ {Tags:["diamond_indicator","tile_indicator","orbit","counter"],brightness:{sky:15,block:15},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,8.5f,3f],scale:[1f,1f,1f]},item:{id:"minecraft:diamond"}}
execute as @e[tag=orbit] at @s run tp @s ~ ~ ~ ~45 ~
summon item_display ~ ~ ~ {Tags:["diamond_indicator","tile_indicator","orbit","clockwise"],brightness:{sky:15,block:15},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,11.5f,3.5f],scale:[1f,1f,1f]},item:{id:"minecraft:diamond"}}
summon item_display ~ ~ ~ {Tags:["diamond_indicator","tile_indicator","orbit","counter"],brightness:{sky:15,block:15},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,8.5f,3f],scale:[1f,1f,1f]},item:{id:"minecraft:diamond"}}
execute as @e[tag=orbit] at @s run tp @s ~ ~ ~ ~45 ~
summon item_display ~ ~ ~ {Tags:["diamond_indicator","tile_indicator","orbit","clockwise"],brightness:{sky:15,block:15},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,11.5f,3.5f],scale:[1f,1f,1f]},item:{id:"minecraft:diamond"}}
summon item_display ~ ~ ~ {Tags:["diamond_indicator","tile_indicator","orbit","counter"],brightness:{sky:15,block:15},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,8.5f,3f],scale:[1f,1f,1f]},item:{id:"minecraft:diamond"}}
execute as @e[tag=orbit] at @s run tp @s ~ ~ ~ ~45 ~
summon item_display ~ ~ ~ {Tags:["diamond_indicator","tile_indicator","orbit","clockwise"],brightness:{sky:15,block:15},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,11.5f,3.5f],scale:[1f,1f,1f]},item:{id:"minecraft:diamond"}}
summon item_display ~ ~ ~ {Tags:["diamond_indicator","tile_indicator","orbit","counter"],brightness:{sky:15,block:15},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,8.5f,3f],scale:[1f,1f,1f]},item:{id:"minecraft:diamond"}}
execute as @e[tag=orbit] at @s run tp @s ~ ~ ~ ~45 ~
summon item_display ~ ~ ~ {Tags:["diamond_indicator","tile_indicator","orbit","clockwise"],brightness:{sky:15,block:15},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,11.5f,3.5f],scale:[1f,1f,1f]},item:{id:"minecraft:diamond"}}
summon item_display ~ ~ ~ {Tags:["diamond_indicator","tile_indicator","orbit","counter"],brightness:{sky:15,block:15},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,8.5f,3f],scale:[1f,1f,1f]},item:{id:"minecraft:diamond"}}
execute as @e[tag=orbit] at @s run tp @s ~ ~ ~ ~45 ~
summon item_display ~ ~ ~ {Tags:["diamond_indicator","tile_indicator","orbit","clockwise"],brightness:{sky:15,block:15},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,11.5f,3.5f],scale:[1f,1f,1f]},item:{id:"minecraft:diamond"}}
summon item_display ~ ~ ~ {Tags:["diamond_indicator","tile_indicator","orbit","counter"],brightness:{sky:15,block:15},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,8.5f,3f],scale:[1f,1f,1f]},item:{id:"minecraft:diamond"}}
execute as @e[tag=orbit] at @s run tp @s ~ ~ ~ ~45 ~
summon item_display ~ ~ ~ {Tags:["diamond_indicator","tile_indicator","orbit","clockwise"],brightness:{sky:15,block:15},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,11.5f,3.5f],scale:[1f,1f,1f]},item:{id:"minecraft:diamond"}}
summon item_display ~ ~ ~ {Tags:["diamond_indicator","tile_indicator","orbit","counter"],brightness:{sky:15,block:15},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,8.5f,3f],scale:[1f,1f,1f]},item:{id:"minecraft:diamond"}}
execute as @e[tag=orbit] at @s run tp @s ~ ~ ~ ~45 ~

execute as @e[tag=diamond_indicator] at @s run data modify entity @s teleport_duration set value 4