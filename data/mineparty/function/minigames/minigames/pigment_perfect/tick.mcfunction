# Schedule self
schedule function mineparty:minigames/minigames/pigment_perfect/tick 1t

# rotating_rat.gif 
execute as @e[tag=pigment_perfect_reference] at @s run tp @s ~ ~ ~ ~1 ~

# Refill cauldrons
execute at @e[tag=pigment_perfect_cauldron] run setblock ~ ~ ~ minecraft:water_cauldron[level=3]