# Load bullet
execute at @n[tag=russian_roulette_display] run summon text_display ^1.05 ^.6 ^ {billboard:"fixed",teleport_duration:0,Tags:["bullet","bullet_2","root"],Passengers:[{id:"minecraft:text_display",billboard:"fixed",teleport_duration:0,Tags:["bullet","bullet_2"],Passengers:[{id:"minecraft:text_display",billboard:"fixed",teleport_duration:0,Tags:["bullet","bullet_2","back"],brightness:{sky:15,block:15},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,-0.25f],scale:[6f,6f,6f]},text:{"color":"#DD8800","text":"◎"},background:14518272}],brightness:{sky:15,block:15},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,-0.125f],scale:[6f,6f,6f]},text:{"color":"gold","text":"◎"},background:16711680}],brightness:{sky:15,block:15},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[6f,6f,6f]},text:{"color":"#FFDD00","text":"◎"},background:16711680}

# Sound
execute at @n[tag=bullet_2,tag=root] run playsound minecraft:block.copper.hit block @a ~ ~ ~ 0.8 2

# Orient displays towards players
execute as @e[tag=bullet] at @s rotated as @n[tag=russian_roulette_display] run tp @s ~ ~ ~ ~ 0

# Schedule next
schedule function mineparty:minigames/minigames/russian_roulette/bullet/reload/3 1t