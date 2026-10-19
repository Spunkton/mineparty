# Add score
scoreboard players add Blue minigames_teams 1
execute as @e[tag=sulfurball_goal_pink] at @s positioned ~0.5 ~4 ~0.5 if entity @n[type=sulfur_cube,tag=sulfur_ball,dx=2,dy=0,dz=6] run scoreboard players add Blue minigames_teams 1

# Send chat message
execute as @e[tag=sulfurball_goal_pink] at @s positioned ~0.5 ~4 ~0.5 unless entity @n[type=sulfur_cube,tag=sulfur_ball,dx=2,dy=0,dz=6] run tellraw @a {"color":"aqua","text":"Blue scored!"}
execute as @e[tag=sulfurball_goal_pink] at @s positioned ~0.5 ~4 ~0.5 if entity @n[type=sulfur_cube,tag=sulfur_ball,dx=2,dy=0,dz=6] run tellraw @a {"color":"aqua","text":"Blue DUNKED!"}

# Log who just scored (Blue)
scoreboard players set #just_scored minigames 1

# General goal function
function mineparty:minigames/minigames/sulfurball/goal