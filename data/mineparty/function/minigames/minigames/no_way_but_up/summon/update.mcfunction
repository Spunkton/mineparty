# Whatever
execute at @n[tag=nwbu_start] run fill ~-1 ~-1 ~-1 ~1 ~4 ~1 air

# Get data for the position of the next block (cylindrical coords)
execute as @n[tag=nwbu_highest] at @s store result entity @s Rotation[0] float 0.5 run random value -359..360
execute as @n[tag=nwbu_highest] at @s store result entity @s data.height float 0.1 run random value -5..0
# Jump depth gets deeper as game goes on
execute if score #nwbu_clouds mineparty matches ..20 as @n[tag=nwbu_highest] at @s store result entity @s data.depth float 0.1 run random value 20..30
execute if score #nwbu_clouds mineparty matches 21..40 as @n[tag=nwbu_highest] at @s store result entity @s data.depth float 0.1 run random value 25..32
execute if score #nwbu_clouds mineparty matches 41..60 as @n[tag=nwbu_highest] at @s store result entity @s data.depth float 0.1 run random value 32..36
execute if score #nwbu_clouds mineparty matches 61..70 as @n[tag=nwbu_highest] at @s store result entity @s data.depth float 0.1 run random value 36..40
execute if score #nwbu_clouds mineparty matches 71.. as @n[tag=nwbu_highest] at @s store result entity @s data.depth float 0.1 run random value 38..40

# Add to cloud count
scoreboard players add #nwbu_clouds mineparty 1

# Increase speed every 2 clouds
scoreboard players operation #nwbu_clouds_mod mineparty = #nwbu_clouds mineparty
function mineparty:other/calc/mod {input:"#nwbu_clouds_mod mineparty",amount:2}
execute if score #nwbu_clouds_mod mineparty matches 0 unless score #nwbu_tick_max mineparty matches ..10 store result bossbar mineparty:no_way_but_up max run scoreboard players remove #nwbu_tick_max mineparty 1

# Update other clouds
scoreboard players add @e[tag=nwbu_cloud] minigames 1
execute unless score #nwbu_clouds mineparty matches 96.. as @e[tag=nwbu_display] if score @s minigames matches 1.. run data modify entity @s Glowing set value false
execute as @e[tag=nwbu_display] if score @s minigames matches 3 run data modify entity @s block_state set value "minecraft:light_gray_wool"
execute as @e[tag=nwbu_display] if score @s minigames matches 4 run data modify entity @s block_state set value "minecraft:gray_wool"
execute as @e[tag=nwbu_display] if score @s minigames matches 5 run data modify entity @s block_state set value "minecraft:black_wool"

# Run summon
execute unless score #nwbu_clouds mineparty matches 96.. run execute as @n[tag=nwbu_highest] at @s run function mineparty:minigames/minigames/no_way_but_up/summon/summon with entity @s data

# Kill too old clouds
tag @e[tag=nwbu_cloud,scores={minigames=6..}] add old
scoreboard players reset @e[tag=nwbu_cloud,tag=old] minigames
scoreboard players reset @e[tag=nwbu_cloud,tag=old] y_level
kill @e[tag=nwbu_cloud,tag=old]

# Teleport highest marker to highest cloud
execute as @n[tag=nwbu_highest] at @n[tag=nwbu_ghast,scores={minigames=0}] run tp @s ~ ~1 ~

# Update bossbar
### Score
bossbar set mineparty:no_way_but_up name ["",{"color":"white","text":"Score"},{"color":"gray","text":": "},{"color":"gold","score":{"name":"#nwbu_clouds","objective":"mineparty"}}]
### Color for speed
execute if score #nwbu_tick_max mineparty matches ..10 run bossbar set mineparty:no_way_but_up color yellow
execute if score #nwbu_clouds mineparty matches 80.. run bossbar set mineparty:no_way_but_up color red


# Cancel schedule if over 100 clouds
execute if score #nwbu_clouds mineparty matches 100.. run scoreboard players add @a[tag=!not_playing] minigames_rank 1
execute if score #nwbu_clouds mineparty matches 100.. as @a[tag=!lost,tag=!not_playing] at @s run function mineparty:minigames/minigames/no_way_but_up/win
execute if score #nwbu_clouds mineparty matches 100.. run function mineparty:minigames/minigames/no_way_but_up/end