# Map tick stuff, mostly showing useful indicators on the tiles

# Indicators
function mineparty:map/indicator

# Occupied tiles should forceload so they can always be tp'd to
execute as @n[type=marker,tag=occupied,tag=!forceloading] at @s store success score #check mineparty run forceload add ~ ~
execute as @n[type=marker,tag=occupied,tag=!forceloading] if score #check mineparty matches 0 run tag @s add dont_unload
tag @e[type=marker,tag=occupied,tag=!forceloading] add forceloading

# Unoccupied tiles remove forceload (if place wasnt already forceloaded before)
execute as @e[type=marker,tag=!occupied,tag=forceloading,tag=!dont_unload] at @s run forceload remove ~ ~
tag @e[type=marker,tag=!occupied,tag=forceloading] remove forceloading
tag @e[type=marker,tag=!occupied,tag=dont_unload] remove dont_unload

# Remove update tag
tag @e[type=marker,tag=tile] remove update