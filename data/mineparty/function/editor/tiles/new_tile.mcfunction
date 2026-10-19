# Kill self if there already is a tile here
execute if entity @n[tag=tile,tag=!new,distance=..3] run tellraw @p {"color":"red","text":"Tile is too nearby other tile."}
execute if entity @n[tag=tile,tag=!new,distance=..3] run kill @s
execute if entity @n[tag=tile,tag=!new,distance=..3] run return 0

# Place blocks
execute at @n[tag=tile,tag=new] as @p[predicate=!mineparty:sneaking] if items entity @s weapon.* *[minecraft:custom_data~{tile_spawner:true}] as @n[tag=tile,tag=new] run function mineparty:editor/tiles/new_tile/place_blocks with entity @s data

# Set data
### Name
data modify entity @n[tag=tile,tag=new] data.name set from entity @n[tag=tile,tag=new] CustomName
### Map
data modify entity @n[tag=tile,tag=new] data.map set from entity @n[tag=tile,tag=!new] data.map

#Otherwise place structure
###

# Remove leftover data from spawn egg
data remove entity @n[tag=tile,tag=new] data.tile_spawner
data remove entity @n[tag=tile,tag=new] data.editor_tool

# Little sound
playsound minecraft:block.netherite_block.place block @a

tag @s remove new