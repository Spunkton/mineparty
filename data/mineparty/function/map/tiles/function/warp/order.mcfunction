# Orders the warp tiles
tag @s add ordered
scoreboard players add @e[tag=tile,tag=warp,tag=!ordered] minigames 1

# Next tile
execute as @n[tag=tile,tag=warp,tag=!ordered] at @s run return run function mineparty:map/tiles/function/warp/order