# Clear rulebook
clear @a *[custom_data~{rulebook:true}]

# Reset scores
scoreboard players reset * minigames
scoreboard players reset * minigames_rank
scoreboard players set @a[tag=!not_playing] minigames 0
scoreboard players set #can_shoot minigames 0

# Set play order
execute as @a[tag=!not_playing,sort=random] run function mineparty:minigames/minigames/russian_roulette/order
tag @a remove ordered
tag @a remove taking_shot
tag @p[scores={minigames=0}] add taking_shot

# If player is alone
execute unless entity @p[tag=!dead,tag=!not_playing,scores={minigames=1}] run tellraw @p[tag=!not_playing] "..."
execute unless entity @p[tag=!dead,tag=!not_playing,scores={minigames=1}] run schedule function mineparty:minigames/minigames/russian_roulette/alone/notif 3s
execute unless entity @p[tag=!dead,tag=!not_playing,scores={minigames=1}] run schedule function mineparty:minigames/minigames/russian_roulette/end 6s
execute unless entity @p[tag=!dead,tag=!not_playing,scores={minigames=1}] run return fail

# Set gamemodes
gamemode adventure @p[tag=taking_shot]
gamemode spectator @a[tag=!taking_shot]

# Summon bullet display
function mineparty:minigames/minigames/russian_roulette/bullet/reload

# Teleport to start and spectate player taking shot
execute at @n[tag=russian_roulette_start] run tp @p[tag=taking_shot] ~ ~ ~
execute at @n[tag=russian_roulette_start] run spreadplayers ~ ~ 0.1 1 false @a[tag=!taking_shot]
execute as @a at @s anchored eyes facing entity @p[tag=taking_shot] eyes run tp @s ~ ~ ~ ~ ~
execute as @a[tag=!taking_shot] at @s anchored feet run tp @s ^ ^ ^-2
execute as @p[tag=taking_shot] at @s anchored eyes facing entity @n[tag=russian_roulette_shoot] eyes run tp @s ~ ~ ~ ~ ~

# Set spawn
execute at @n[tag=russian_roulette_spawn] run spawnpoint @a[tag=!not_playing]