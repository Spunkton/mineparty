#Summons player heads above the tile to show who occupies it
#Executed as tile who has the indicator

#Only one player
execute if data entity @s data.occupied[0] unless data entity @s data.occupied[1] run summon item_display ~ ~ ~ {billboard:"vertical",item_display:"fixed",Tags:["occupied_indicator","tile_indicator","0"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,4f,0f],scale:[1f,1f,1f]},item:{id:"minecraft:player_head",count:1},brightness:{sky:15,block:15}}

#Two players
execute if data entity @s data.occupied[1] unless data entity @s data.occupied[2] run summon item_display ~ ~ ~ {billboard:"vertical",item_display:"fixed",Tags:["occupied_indicator","tile_indicator","0"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-0.5f,4f,0f],scale:[1f,1f,1f]},item:{id:"minecraft:player_head",count:1},brightness:{sky:15,block:15}}
execute if data entity @s data.occupied[1] unless data entity @s data.occupied[2] run summon item_display ~ ~ ~ {billboard:"vertical",item_display:"fixed",Tags:["occupied_indicator","tile_indicator","1"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0.5f,4f,0f],scale:[1f,1f,1f]},item:{id:"minecraft:player_head",count:1},brightness:{sky:15,block:15}}

#Three or more players
#Player heads
execute if data entity @s data.occupied[2] run summon item_display ~ ~ ~ {billboard:"vertical",item_display:"fixed",Tags:["occupied_indicator","tile_indicator","0"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-1f,4f,0f],scale:[1f,1f,1f]},item:{id:"minecraft:player_head",count:1},brightness:{sky:15,block:15}}
execute if data entity @s data.occupied[2] run summon item_display ~ ~ ~ {billboard:"vertical",item_display:"fixed",Tags:["occupied_indicator","tile_indicator","1"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,4f,0f],scale:[1f,1f,1f]},item:{id:"minecraft:player_head",count:1},brightness:{sky:15,block:15}}
#Plus sign
execute if data entity @s data.occupied[2] run summon item_display ~ ~ ~ {billboard:"vertical",item_display:"fixed",Tags:["occupied_indicator","tile_indicator"],brightness:{sky:15,block:15},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[1f,4f,0f],scale:[1f,0.2f,0.2f]},item:{id:"minecraft:smooth_quartz",count:1}}
execute if data entity @s data.occupied[2] run summon item_display ~ ~ ~ {billboard:"vertical",item_display:"fixed",Tags:["occupied_indicator","tile_indicator"],brightness:{sky:15,block:15},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[1f,4f,0f],scale:[0.2f,1f,0.2f]},item:{id:"minecraft:smooth_quartz",count:1}}

#Modify data so it has a cool face
data modify entity @n[tag=occupied_indicator,tag=0,distance=..3] item.components."minecraft:profile"."id" set from entity @s data.occupied[0].UUID
data modify entity @n[tag=occupied_indicator,tag=1,distance=..3] item.components."minecraft:profile"."id" set from entity @s data.occupied[1].UUID