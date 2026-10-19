# Clear previous clouds
kill @e[tag=nwbu_cloud]

# Clear rulebook
clear @a *[custom_data~{rulebook:true}]

# Set gamemodes
gamemode adventure @a[tag=!not_playing]

# Join teams
team join no_collision @a

# Give effects
effect give @a[tag=!not_playing] minecraft:invisibility infinite 0 true

# Reset tags
tag @a remove lost

# Setup bossbar
bossbar remove mineparty:no_way_but_up
bossbar add mineparty:no_way_but_up ["",{"color":"white","text":"Score"},{"color":"gray","text":": "},{"color":"gold","text":"0"}]
bossbar set mineparty:no_way_but_up color white
bossbar set mineparty:no_way_but_up players @a
bossbar set mineparty:no_way_but_up value 1

# Set scores
scoreboard players set #nwbu_clouds mineparty 0
execute store result bossbar mineparty:no_way_but_up max run scoreboard players set #nwbu_tick_max mineparty 40
scoreboard players set #nwbu_tick mineparty 0
scoreboard players reset * minigames
scoreboard players reset * minigames_rank
scoreboard objectives remove y_level
scoreboard objectives add y_level dummy

# Teleport to start
execute at @n[tag=nwbu_start] run fill ~-1 ~-1 ~-1 ~1 ~4 ~1 barrier outline
execute at @n[tag=nwbu_start] run summon happy_ghast ~ ~-1 ~ {Silent:1b,Invulnerable:1b,Team:"no_collision",NoAI:1b,Tags:["nwbu_cloud","nwbu_ghast"],Passengers:[{id:"minecraft:block_display",Tags:["nwbu_cloud","nwbu_display"],Glowing:1b,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-0.5f,-1f,-0.925f],scale:[1f,1f,1f]},block_state:{id:"minecraft:white_wool"}}],active_effects:[{id:"minecraft:invisibility",amplifier:0,duration:-1,show_particles:0b}],attributes:[{id:"minecraft:scale",base:0.25}]}
scoreboard players set @e[tag=nwbu_cloud] minigames 0
execute at @n[tag=nwbu_start] run tp @a ~ ~ ~

# Summon marker that keeps track of the highest block
kill @e[tag=nwbu_highest]
execute at @n[tag=nwbu_start] run summon marker ~ ~ ~ {Tags:["nwbu_highest"],data:{depth:0f,height:0f}}

# Starts tick
function mineparty:minigames/minigames/no_way_but_up/tick

