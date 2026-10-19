# Rotates the orbits smoothly back to slow

# Set scores for calculation
### Fast fraction
scoreboard players operation #smooth_clockwise_fast mineparty = #diamond_animation mineparty
scoreboard players operation #smooth_counter_fast mineparty = #diamond_animation mineparty
function mineparty:other/calc/mult {amount:45,input:"#smooth_clockwise_fast mineparty"}
function mineparty:other/calc/mult {amount:-45,input:"#smooth_counter_fast mineparty"}
### DEBUG
#tellraw @a {"score":{"name":"#smooth_clockwise_fast","objective":"mineparty"}}
### Slow fraction
scoreboard players operation #smooth_clockwise_slow mineparty = #diamond_animation mineparty
scoreboard players operation #smooth_counter_slow mineparty = #diamond_animation mineparty
scoreboard players remove #smooth_clockwise_slow mineparty 90
scoreboard players remove #smooth_counter_slow mineparty 90
function mineparty:other/calc/mult {amount:0,input:"#smooth_clockwise_slow mineparty"}
function mineparty:other/calc/mult {amount:0,input:"#smooth_counter_slow mineparty"}
### DEBUG
#tellraw @a {"score":{"name":"#smooth_clockwise_slow","objective":"mineparty"}}

# Calculate and store angle that will be rotated
execute store result storage mineparty:main animation.rotate_orbits.clockwise float 0.01111 run scoreboard players operation #smooth_clockwise_fast mineparty -= #smooth_clockwise_slow mineparty
execute store result storage mineparty:main animation.rotate_orbits.counter float 0.01111 run scoreboard players operation #smooth_counter_fast mineparty -= #smooth_counter_slow mineparty

# Rotate!
function mineparty:game/tiles/diamond/animation/rotate_orbits_with_data with storage mineparty:main animation.rotate_orbits