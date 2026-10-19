# Rotates the orbits smoothly back to slow

# Set scores for calculation
### Fast fraction
scoreboard players operation #smooth_small_slow mineparty = #diamond_animation mineparty
function mineparty:other/calc/mult {amount:15,input:"#smooth_small_slow mineparty"}
### Slow fraction
scoreboard players operation #smooth_small_fast mineparty = #diamond_animation mineparty
scoreboard players remove #smooth_small_fast mineparty 50
function mineparty:other/calc/mult {amount:75,input:"#smooth_small_fast mineparty"}

# Calculate and store angle that will be rotated
execute store result storage mineparty:main animation.rotate_small_diamond.angle float 0.02 run scoreboard players operation #smooth_small_slow mineparty -= #smooth_small_fast mineparty

# Rotate!
function mineparty:game/tiles/diamond/animation/rotate_small_diamond_with_data with storage mineparty:main animation.rotate_small_diamond