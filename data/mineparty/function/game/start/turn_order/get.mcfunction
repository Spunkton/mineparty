# Remove doesnt_roll tag
tag @a[tag=!ordered,tag=!not_playing] remove doesnt_roll

# Set highest score
scoreboard players reset #highest dice_roll
scoreboard players operation #highest dice_roll < @a[tag=!ordered,tag=!not_playing] dice_roll
scoreboard players operation #highest dice_roll > @a[tag=!ordered,tag=!not_playing] dice_roll

# Tag everyone with highest right now
tag @a remove highest
execute as @a[tag=!ordered,tag=!not_playing] if score @s dice_roll = #highest dice_roll run tag @s add highest

# Reroll if there are multiple with the same roll
execute as @p[tag=highest] at @s if entity @p[distance=.1..,tag=highest] run tag @a[tag=!highest] add doesnt_roll
execute as @p[tag=highest] at @s if entity @p[distance=.1..,tag=highest] run scoreboard players remove @a[tag=!highest] dice_roll 10
execute as @p[tag=highest] at @s if entity @p[distance=.1..,tag=highest] run schedule function mineparty:game/start/turn_order/prompt 1t
execute as @p[tag=highest] at @s if entity @p[distance=.1..,tag=highest] run tellraw @a ["",{"selector":"@a[tag=highest]"}," have to reroll."]
execute as @p[tag=highest] at @s if entity @p[distance=.1..,tag=highest] run return 0

# If there is only one highest
execute as @p[tag=highest] run function mineparty:game/start/turn_order/remove with entity @s
execute as @p[tag=highest] run data modify storage mineparty:main turn_order append value {UUID:[I;1,1,1,1]}
execute as @p[tag=highest] run data modify storage mineparty:main turn_order[-1].UUID set from entity @s UUID
tag @p[tag=highest] add ordered

# Schedule self if there are people left to be ordered
execute if entity @p[tag=!ordered,tag=!not_playing] run schedule function mineparty:game/start/turn_order/get 1t

# If everyone is ordered
execute unless entity @p[tag=!ordered,tag=!not_playing] run data modify storage mineparty:main turn_order_announcement set from storage mineparty:main turn_order
execute unless entity @p[tag=!ordered,tag=!not_playing] run tag @a remove taking_turn
execute unless entity @p[tag=!ordered,tag=!not_playing] run tellraw @a "\u00a7l========={Turn order}========="
execute unless entity @p[tag=!ordered,tag=!not_playing] run scoreboard players set #announcement_line mineparty 1
execute unless entity @p[tag=!ordered,tag=!not_playing] run function mineparty:game/start/turn_order/announce
execute unless entity @p[tag=!ordered,tag=!not_playing] run tag @a remove ordered
