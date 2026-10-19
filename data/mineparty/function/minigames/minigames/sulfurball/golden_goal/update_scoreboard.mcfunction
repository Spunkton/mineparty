# Kill old scoreboard
kill @e[tag=sulfurball_scoreboard_display]

# Summon new
execute at @e[tag=sulfurball_scoreboard] run summon text_display ~ ~ ~ {Tags:["sulfurball_scoreboard_display"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[80f,80f,80f]},text:{"color":"gold","text":"OVERTIME"},background:0}

# Point in right direction (toward center)
execute as @e[tag=sulfurball_scoreboard_display] at @s facing entity @n[tag=sulfurball_center] eyes run tp @s ~ ~ ~ ~ 0
### Rounding
execute as @e[tag=sulfurball_scoreboard_display] at @s store result score @s minigames run data get entity @s Rotation[0]
execute as @e[tag=sulfurball_scoreboard_display] at @s run scoreboard players add @s minigames 7
execute as @e[tag=sulfurball_scoreboard_display] at @s run function mineparty:other/calc/div {input:"@s minigames",amount:15}
execute as @e[tag=sulfurball_scoreboard_display] at @s store result entity @s Rotation[0] int 1 run function mineparty:other/calc/mult {input:"@s minigames",amount:15}