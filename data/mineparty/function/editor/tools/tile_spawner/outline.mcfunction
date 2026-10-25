# Outlines placement of the tile

# Summon raycast to find block looked at
execute anchored eyes run function mineparty:other/raycast/expensive {length:11}


# Summon outline there
### If placeable
execute at @n[tag=ray] align xyz positioned ~0.5 ~1.5 ~0.5 unless entity @n[tag=spawner_pointing,distance=..0.1] unless entity @n[tag=tile,distance=..3.9] run summon item_display ~ ~ ~ {Tags:["spawner_pointing"],Passengers:[{id:"minecraft:block_display",Tags:["spawner_indicator"],brightness:{sky:15,block:15},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[1.4375f,-0.5f,-1.5f],scale:[0.0625f,0.0625f,3f]},block_state:"lime_wool"},{id:"minecraft:block_display",Tags:["spawner_indicator"],brightness:{sky:15,block:15},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-1.5f,-0.5f,-1.5f],scale:[0.0625f,0.0625f,3f]},block_state:"lime_wool"},{id:"minecraft:block_display",Tags:["spawner_indicator"],brightness:{sky:15,block:15},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-1.5f,-0.5f,1.4375f],scale:[3f,0.0625f,0.0625f]},block_state:"lime_wool"},{id:"minecraft:block_display",Tags:["spawner_indicator"],brightness:{sky:15,block:15},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-1.5f,-0.5f,-1.5f],scale:[3f,0.0625f,0.0625f]},block_state:"lime_wool"}]}
### If not
execute at @n[tag=ray] align xyz positioned ~0.5 ~1.5 ~0.5 unless entity @n[tag=spawner_pointing,distance=..0.1] if entity @n[tag=tile,distance=..3.9] run summon item_display ~ ~ ~ {Tags:["spawner_pointing"],Passengers:[{id:"minecraft:block_display",Tags:["spawner_indicator"],brightness:{sky:15,block:15},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[1.4375f,-0.5f,-1.5f],scale:[0.0625f,0.0625f,3f]},block_state:"red_stained_glass"},{id:"minecraft:block_display",Tags:["spawner_indicator"],brightness:{sky:15,block:15},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-1.5f,-0.5f,-1.5f],scale:[0.0625f,0.0625f,3f]},block_state:"red_stained_glass"},{id:"minecraft:block_display",Tags:["spawner_indicator"],brightness:{sky:15,block:15},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-1.5f,-0.5f,1.4375f],scale:[3f,0.0625f,0.0625f]},block_state:"red_stained_glass"},{id:"minecraft:block_display",Tags:["spawner_indicator"],brightness:{sky:15,block:15},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-1.5f,-0.5f,-1.5f],scale:[3f,0.0625f,0.0625f]},block_state:"red_stained_glass"}]}

execute at @n[tag=ray] align xyz positioned ~0.5 ~1.5 ~0.5 run tag @n[tag=spawner_pointing,distance=..0.1] remove no_longer_pointed

# Clean up
kill @n[tag=ray]