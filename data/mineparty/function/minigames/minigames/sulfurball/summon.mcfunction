# Summons a new ball at the center

# Roll random number that decides ball type
#execute store result score #random minigames run random value 0..4

# Summon
#execute if score #random minigames matches 0 at @n[tag=sulfurball_center] run summon sulfur_cube ~ ~3 ~ {Motion:[0f,1f,0f],Size:1,Silent:0b,Glowing:1b,Tags:["sulfur_ball"],equipment:{body:{id:"minecraft:red_wool",count:1}}}
#execute if score #random minigames matches 1 at @n[tag=sulfurball_center] run summon sulfur_cube ~ ~3 ~ {Motion:[0f,1f,0f],Size:1,Silent:0b,Glowing:1b,Tags:["sulfur_ball"],equipment:{body:{id:"minecraft:orange_concrete_powder",count:1}}}
#execute if score #random minigames matches 2 at @n[tag=sulfurball_center] run summon sulfur_cube ~ ~3 ~ {Motion:[0f,1f,0f],Size:1,Silent:0b,Glowing:1b,Tags:["sulfur_ball"],equipment:{body:{id:"minecraft:sponge",count:1}}}
#execute if score #random minigames matches 3 at @n[tag=sulfurball_center] run summon sulfur_cube ~ ~3 ~ {Motion:[0f,1f,0f],Size:1,Silent:0b,Glowing:1b,Tags:["sulfur_ball"],equipment:{body:{id:"minecraft:bamboo_block",count:1}}}
#execute if score #random minigames matches 4 at @n[tag=sulfurball_center] run summon sulfur_cube ~ ~3 ~ {Motion:[0f,1f,0f],Size:1,Silent:0b,Glowing:1b,Tags:["sulfur_ball"],equipment:{body:{id:"minecraft:blue_ice",count:1}}}

execute unless score #just_scored minigames matches 1..2 at @n[tag=sulfurball_center] run summon sulfur_cube ~ ~3 ~ {Motion:[0f,1f,0f],Size:1,Silent:0b,Glowing:1b,Tags:["sulfur_ball"],equipment:{body:{id:"minecraft:white_concrete_powder",count:1}},attributes:[{id:"minecraft:gravity",base:0.07}]}
execute if score #just_scored minigames matches 1 as @n[tag=sulfurball_start_pink] at @s facing entity @n[tag=sulfurball_center] feet run summon sulfur_cube ^ ^3 ^12 {Motion:[0f,1f,0f],Size:1,Silent:0b,Glowing:1b,Tags:["sulfur_ball"],equipment:{body:{id:"minecraft:white_concrete_powder",count:1}},attributes:[{id:"minecraft:gravity",base:0.07}]}
execute if score #just_scored minigames matches 2 as @n[tag=sulfurball_start_blue] at @s facing entity @n[tag=sulfurball_center] feet run summon sulfur_cube ^ ^3 ^12 {Motion:[0f,1f,0f],Size:1,Silent:0b,Glowing:1b,Tags:["sulfur_ball"],equipment:{body:{id:"minecraft:white_concrete_powder",count:1}},attributes:[{id:"minecraft:gravity",base:0.07}]}

# Particle!
execute at @n[tag=sulfurball_center] run particle geyser_poof{water_blocks:5,burst_impulse_base:5} ~ ~3 ~ 0 0 0 0 25 normal