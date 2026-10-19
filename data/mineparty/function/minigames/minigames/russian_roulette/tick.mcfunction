# Schedule self
schedule function mineparty:minigames/minigames/sulfurball/tick 1t

# In case of overtime
execute if score #golden_goal minigames matches 1 run function mineparty:minigames/minigames/sulfurball/golden_goal/tick

# Fishing rod range
execute as @e[type=minecraft:fishing_bobber,tag=!sped_up] at @s store result entity @s Motion[0] float 0.0002 run data get entity @s Motion[0] 10000
execute as @e[type=minecraft:fishing_bobber,tag=!sped_up] at @s store result entity @s Motion[1] float 0.0002 run data get entity @s Motion[1] 10000
execute as @e[type=minecraft:fishing_bobber,tag=!sped_up] at @s store result entity @s Motion[2] float 0.0002 run data get entity @s Motion[2] 10000
tag @e[type=fishing_bobber] add sped_up

# Give wind charges
execute as @a[tag=!not_playing] store result score @s minigames run clear @s wind_charge 0
execute as @a[tag=!not_playing,scores={minigames=..1}] run give @s wind_charge[use_cooldown={seconds:3}] 1

# Delete too far wind charges
execute as @e[type=wind_charge] at @s unless entity @p[distance=..128] run kill @s

# Detect goals
execute as @e[tag=sulfurball_goal_pink] at @s positioned ~0.5 ~ ~0.5 if entity @n[type=sulfur_cube,tag=sulfur_ball,dx=2,dy=4,dz=6] run function mineparty:minigames/minigames/sulfurball/goal/blue
execute as @e[tag=sulfurball_goal_blue] at @s positioned ~0.5 ~ ~0.5 if entity @n[type=sulfur_cube,tag=sulfur_ball,dx=2,dy=4,dz=6] run function mineparty:minigames/minigames/sulfurball/goal/pink