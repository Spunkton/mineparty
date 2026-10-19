# Kills the player taking the shot

# Effects
execute at @p[tag=taking_shot] run particle minecraft:explosion_emitter ~ ~ ~ 0 0 0 0 1
execute at @n[tag=russian_roulette_shoot] run playsound minecraft:entity.generic.explode block @a ~ ~ ~ 1 2 0.2
execute at @n[tag=russian_roulette_shoot] run playsound minecraft:item.mace.smash_ground_heavy block @a ~ ~ ~ 1 0
execute at @n[tag=russian_roulette_shoot] run particle flash{color:[1.000,1.000,1.000,1.00]} ~ ~ ~ 0 0 0 0 0 normal

# Remove from turn order
scoreboard players reset @p[tag=taking_shot] minigames

# Tag as dead
tag @p[tag=taking_shot] add dead

# Replace bullet display (it's glitched fsr)
kill @e[tag=bullet]
execute at @n[tag=russian_roulette_display] run summon text_display ^ ^ ^ {billboard:"fixed",teleport_duration:0,Tags:["bullet","death","root"],Passengers:[{id:"minecraft:text_display",billboard:"fixed",teleport_duration:0,Tags:["bullet","death"],Passengers:[{id:"minecraft:text_display",billboard:"fixed",teleport_duration:0,Tags:["bullet","death","back"],brightness:{sky:15,block:15},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,-0.25f],scale:[18f,18f,18f]},text:{"color":"dark_red","text":"☠"},background:14518272}],brightness:{sky:15,block:15},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,-0.125f],scale:[18f,18f,18f]},text:{"color":"red","text":"☠"},background:16711680}],brightness:{sky:15,block:15},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[18f,18f,18f]},text:{"color":"white","text":"☠"},background:16711680}
execute as @e[tag=bullet] at @s rotated as @n[tag=russian_roulette_display] run tp @s ~ ~ ~ ~ 0

# Spectate now
gamemode spectator @p[tag=taking_shot]

# Rank them
scoreboard players set @p[tag=taking_shot] minigames_rank 1
scoreboard players add @a[tag=!taking_shot,tag=!not_playing,tag=dead] minigames_rank 1

# Custom death message
execute store result score #fail_check mineparty run gamerule show_death_messages
gamerule show_death_messages false
tellraw @a [{"color":"dark_red","selector":"@p[tag=taking_shot]"}," was eliminated."]

# And finally...
kill @p[tag=taking_shot]

# Reset settings
execute if score #fail_check mineparty matches 1 run gamerule show_death_messages true

# Check if game is over
execute unless entity @p[tag=!dead,tag=!not_playing,scores={minigames=2}] run function mineparty:minigames/minigames/russian_roulette/end
execute unless entity @p[tag=!dead,tag=!not_playing,scores={minigames=2}] run return 1

# Schedule next player
schedule function mineparty:minigames/minigames/russian_roulette/next_player/after_kill 3s
schedule function mineparty:minigames/minigames/russian_roulette/bullet/reload 3s