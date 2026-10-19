# Lets next player take a shot.

# Remove 1 from all alive players
scoreboard players remove @a[tag=!not_playing,tag=!dead] minigames 1
### Loop back
execute as @p[scores={minigames=..-1}] store result score @s minigames if entity @a[tag=!not_playing,tag=!dead,scores={minigames=0..}]

# Move tag
tag @p[tag=taking_shot] add taking_shot_old
tag @a remove taking_shot
tag @p[scores={minigames=..0}] add taking_shot

# Teleport to start and spectate player taking shot
execute at @n[tag=russian_roulette_start] run tp @p[tag=taking_shot] ~ ~ ~
execute at @n[tag=russian_roulette_start] run spreadplayers ~ ~ 0.1 1 false @p[tag=taking_shot_old]
execute as @p[tag=taking_shot_old] at @s anchored eyes facing entity @p[tag=taking_shot] eyes run tp @s ~ ~ ~ ~ ~
execute as @p[tag=taking_shot_old] at @s anchored feet run tp @s ^ ^ ^-2
execute as @p[tag=taking_shot] at @s anchored eyes facing entity @n[tag=russian_roulette_shoot] eyes run tp @s ~ ~ ~ ~ ~

# Set gamemodes
gamemode adventure @p[tag=taking_shot]


# Clean up
tag @a remove taking_shot_old
