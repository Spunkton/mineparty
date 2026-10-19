# Load bullet
execute at @n[tag=russian_roulette_display] run summon text_display ^-1.05 ^1.8 ^ {billboard:"fixed",teleport_duration:0,Tags:["bullet","bullet_5","root"],Passengers:[{id:"minecraft:text_display",billboard:"fixed",teleport_duration:0,Tags:["bullet","bullet_5"],Passengers:[{id:"minecraft:text_display",billboard:"fixed",teleport_duration:0,Tags:["bullet","bullet_5","back"],brightness:{sky:15,block:15},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,-0.25f],scale:[6f,6f,6f]},text:{"color":"#DD8800","text":"◎"},background:14518272}],brightness:{sky:15,block:15},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,-0.125f],scale:[6f,6f,6f]},text:{"color":"gold","text":"◎"},background:16711680}],brightness:{sky:15,block:15},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[6f,6f,6f]},text:{"color":"#FFDD00","text":"◎"},background:16711680}

# Sound
execute at @n[tag=bullet_5,tag=root] run playsound minecraft:block.copper.hit block @a ~ ~ ~ 0.8 2

# Orient displays towards players
execute as @e[tag=bullet] at @s rotated as @n[tag=russian_roulette_display] run tp @s ~ ~ ~ ~ 0

# Set scores for positions
scoreboard players set @e[tag=bullet_0] minigames 0
scoreboard players set @e[tag=bullet_1] minigames 1
scoreboard players set @e[tag=bullet_2] minigames 2
scoreboard players set @e[tag=bullet_3] minigames 3
scoreboard players set @e[tag=bullet_4] minigames 4
scoreboard players set @e[tag=bullet_5] minigames 5

# Give one bullet the real shot
tag @n[sort=random,tag=root,tag=bullet] add lethal

# Roll the barrel
schedule function mineparty:minigames/minigames/russian_roulette/bullet/roll 3t