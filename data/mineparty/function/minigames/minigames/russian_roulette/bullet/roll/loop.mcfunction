# Rotate according to speed
execute as @e[tag=root] run data modify entity @s data.pos.x set compute entity @s float mineparty:minigames/russian_roulette/side
execute as @e[tag=root] run data modify entity @s data.pos.y set compute entity @s float mineparty:minigames/russian_roulette/height
execute as @e[tag=root] run function mineparty:minigames/minigames/russian_roulette/bullet/roll/move with entity @s data.pos

# Roll based on speed
scoreboard players operation @e[tag=root] minigames_teams -= #animation_speed mineparty

# Clicking sound
### Always clicks if really fast
execute if score #animation_speed mineparty matches 60.. at @n[tag=russian_roulette_display] positioned ~ ~2.4 ~ run playsound minecraft:block.tripwire.click_on block @a ~ ~ ~ 0.2 2
### If nearest bullet to top has not yet clicked
execute unless score #animation_speed mineparty matches 60.. at @n[tag=russian_roulette_display] positioned ~ ~2.4 ~ as @n[tag=bullet,tag=root] if entity @s[tag=!clicked,tag=root,tag=bullet,distance=..1] run playsound minecraft:block.tripwire.click_on block @a ~ ~ ~ 0.2 2
execute unless score #animation_speed mineparty matches 60.. at @n[tag=russian_roulette_display] positioned ~ ~2.4 ~ run tag @n[tag=bullet,tag=root] add clicked
execute unless score #animation_speed mineparty matches 60.. at @n[tag=russian_roulette_display] positioned ~ ~2.4 ~ as @n[tag=bullet,tag=root] at @s run tag @e[tag=bullet,tag=root,distance=.1..] remove clicked

# Tick down
scoreboard players remove #animation_speed mineparty 1

# Schedule self (Ends at 4 because that's when the cilinder is the original rotation again)
execute unless score #animation_speed mineparty matches ..4 run schedule function mineparty:minigames/minigames/russian_roulette/bullet/roll/loop 1t
execute unless score #animation_speed mineparty matches ..4 run return 1

# When it's over

# Return to normal teleport duration
execute as @e[tag=bullet] run data modify entity @s teleport_duration set value 1

# Return to positions
execute at @n[tag=russian_roulette_display] run tp @n[tag=bullet_0,tag=root] ^ ^2.40 ^
execute at @n[tag=russian_roulette_display] run tp @n[tag=bullet_1,tag=root] ^1.05 ^1.8 ^
execute at @n[tag=russian_roulette_display] run tp @n[tag=bullet_2,tag=root] ^1.05 ^0.6 ^
execute at @n[tag=russian_roulette_display] run tp @n[tag=bullet_3,tag=root] ^ ^ ^
execute at @n[tag=russian_roulette_display] run tp @n[tag=bullet_4,tag=root] ^-1.05 ^0.6 ^
execute at @n[tag=russian_roulette_display] run tp @n[tag=bullet_5,tag=root] ^-1.05 ^1.8 ^

# Clicks into position
execute at @n[tag=russian_roulette_display] run playsound minecraft:block.chain.place block @a ~ ~ ~ 1 2

# You can shoot now!
scoreboard players set #can_shoot minigames 1

# Ominous message
title @p[tag=taking_shot] subtitle {"color":"dark_red","text":"Take the shot."}
title @p[tag=taking_shot] title ""