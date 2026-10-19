# Schedule self
schedule function mineparty:minigames/minigames/no_way_but_up/tick 1t

# Just templating
title @a actionbar "Survive!"

# Tick up
execute store result bossbar mineparty:no_way_but_up value run scoreboard players add #nwbu_tick mineparty 1
scoreboard players operation #nwbu_tick mineparty %= #nwbu_tick_max mineparty

# Summon cloud if hit max
execute if score #nwbu_tick mineparty matches 0 run function mineparty:minigames/minigames/no_way_but_up/summon/update

# Sounds
stopsound @a * minecraft:entity.happy_ghast.harness_goggles_up
stopsound @a * minecraft:entity.happy_ghast.harness_goggles_down

# Check if player fell off
### Store heights
execute as @a at @s store result score @s y_level run data get entity @s Pos[1] 10
execute as @e[tag=nwbu_ghast] at @s store result score @s y_level run data get entity @s Pos[1] 10
scoreboard players operation #lowest y_level > * y_level
scoreboard players operation #lowest y_level < @e[tag=nwbu_ghast] y_level
### Check if underneath all the clouds
execute as @a[tag=!lost] at @s if score @s y_level <= #lowest y_level run function mineparty:minigames/minigames/no_way_but_up/lose