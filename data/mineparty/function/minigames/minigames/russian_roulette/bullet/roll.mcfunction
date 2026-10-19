# Animates a roll

# Set teleport duration
execute as @e[tag=bullet] run data modify entity @s teleport_duration set value 1

# Set positions for bullets
scoreboard players set @n[tag=bullet_0,tag=root] minigames_teams 0
scoreboard players set @n[tag=bullet_1,tag=root] minigames_teams 105
scoreboard players set @n[tag=bullet_2,tag=root] minigames_teams 210
scoreboard players set @n[tag=bullet_3,tag=root] minigames_teams -314
scoreboard players set @n[tag=bullet_4,tag=root] minigames_teams -210
scoreboard players set @n[tag=bullet_5,tag=root] minigames_teams -105

# Set starting animation speed
scoreboard players set #animation_speed mineparty 100

# Reset click sound tag
tag @e[tag=bullet] remove clicked

# Start roll
function mineparty:minigames/minigames/russian_roulette/bullet/roll/loop