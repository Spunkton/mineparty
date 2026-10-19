# Rotates the orbits smoothly back to slow
# Default scale is 2

# 50 = 2, 10 = 0

# Set scores for calculation
### Fast fraction
scoreboard players operation #shrink_small_diamond mineparty = #diamond_animation mineparty
function mineparty:other/calc/mult {amount:10,input:"#shrink_small_diamond mineparty"}
execute store result entity @n[tag=diamond_indicator,tag=small] transformation.scale[0] float 0.005 store result entity @n[tag=diamond_indicator,tag=small] transformation.scale[1] float 0.005 store result entity @n[tag=diamond_indicator,tag=small] transformation.scale[2] float 0.005 run scoreboard players remove #shrink_small_diamond mineparty 100