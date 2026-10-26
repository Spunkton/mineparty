# Transforms a tile into a sculk tile
# Executed as and at tile

# Kill old decal if there was one
kill @e[tag=tile_decal,distance=..1]

# Set some tile data
data merge entity @s {CustomName:"Infected Sculk Tile",data:{type:"sculk",name:"Infected Sculk Tile",description:"What used to be an innocent tile, transformed into sculk... Horrible!"}}

# Summon tile decal
function mineparty:map/tiles/decal/sculk

# Lightning for dramatic effect
summon lightning_bolt ~ ~ ~

# Particles
particle sculk_soul ~ ~ ~ 0.75 0 0.75 0.1 64 normal
particle minecraft:soul_fire_flame ~ ~ ~ 0.75 0 0.75 0.01 64 normal

# Sound
playsound minecraft:entity.warden.death block @a ~ ~ ~ 0.7 2 0.3
playsound minecraft:block.sculk_sensor.clicking block @a ~ ~ ~ 1 0.8 1

# Tag self as transformed
tag @s add transformed