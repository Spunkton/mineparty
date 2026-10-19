# Rotates the orbits smoothly back to slow

# Set scores for calculation
scoreboard players operation #smooth_orbit_end mineparty = #diamond_animation mineparty

# Calculate and store angle that will be rotated
execute store result storage mineparty:main animation.rotate_orbits.clockwise float 0.4 store result storage mineparty:main animation.rotate_orbits.counter float -0.4 run scoreboard players add #smooth_orbit_end mineparty 50

# Rotate!
function mineparty:game/tiles/diamond/animation/rotate_orbits_with_data with storage mineparty:main animation.rotate_orbits