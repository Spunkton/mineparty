# Transforms tiles into sculk until the score runs out

# Transform a random eligible tile
execute unless entity @n[type=marker,tag=tile,tag=same_map,tag=!no_transform,tag=!transformed,nbt=!{data:{type:"sculk"}},sort=random] run tellraw @a[tag=debug] {"color":"yellow","text":"No eligible tiles found for transformation."}
execute as @n[type=marker,tag=tile,tag=same_map,tag=!no_transform,tag=!transformed,nbt=!{data:{type:"sculk"}},sort=random] at @s run function mineparty:map/tiles/function/sculk/transform/tile

# Tick down
scoreboard players remove #transform_limit mineparty 1

# Schedule self
execute unless score #transform_limit mineparty matches ..0 run return run schedule function mineparty:map/tiles/function/sculk/transform/loop 1s

# Reset gamerule
schedule function mineparty:map/tiles/function/sculk/transform/reset_gamerule 1s

# Clean up
tag @e[tag=tile] remove same_map