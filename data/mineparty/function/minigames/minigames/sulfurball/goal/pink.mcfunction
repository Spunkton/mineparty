# Add score
scoreboard players add Pink minigames_teams 1
execute as @e[tag=sulfurball_goal_blue] at @s positioned ~0.5 ~4 ~0.5 if entity @n[type=sulfur_cube,tag=sulfur_ball,dx=2,dy=0,dz=6] run scoreboard players add Pink minigames_teams 1

# Send chat message
execute as @e[tag=sulfurball_goal_blue] at @s positioned ~0.5 ~4 ~0.5 unless entity @n[type=sulfur_cube,tag=sulfur_ball,dx=2,dy=0,dz=6] run tellraw @a {"color":"light_purple","text":"Pink scored!"}
execute as @e[tag=sulfurball_goal_blue] at @s positioned ~0.5 ~4 ~0.5 if entity @n[type=sulfur_cube,tag=sulfur_ball,dx=2,dy=0,dz=6] run tellraw @a {"color":"light_purple","text":"Pink DUNKED!"}

# Log who just scored (Pink)
scoreboard players set #just_scored minigames 2

# General goal function
function mineparty:minigames/minigames/sulfurball/goal