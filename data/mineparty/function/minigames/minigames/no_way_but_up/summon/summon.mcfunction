# Needs $(height) and $(depth)

# Summon the cloud
$summon happy_ghast ^ ^$(height) ^$(depth) {Silent:1b,Invulnerable:1b,Team:"no_collision",NoAI:1b,Tags:["nwbu_cloud","nwbu_ghast","new"],Passengers:[{id:"minecraft:block_display",Tags:["nwbu_cloud","nwbu_display","new"],Glowing:1b,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-0.5f,-1f,-0.925f],scale:[1f,1f,1f]},block_state:{id:"minecraft:white_wool"}}],active_effects:[{id:"minecraft:invisibility",amplifier:0,duration:-1,show_particles:0b}],attributes:[{id:"minecraft:scale",base:0.25}]}
$particle poof ^ ^$(height) ^$(depth) 0 0 0 0.2 15
$playsound minecraft:entity.breeze.land block @a ^ ^$(height) ^$(depth) 0.6 2

# Set score
scoreboard players set @e[tag=nwbu_cloud,tag=new] minigames 0
tag @e[tag=nwbu_cloud,tag=new] remove new

# Sounds
stopsound @a * minecraft:entity.happy_ghast.harness_goggles_up
stopsound @a * minecraft:entity.happy_ghast.harness_goggles_down