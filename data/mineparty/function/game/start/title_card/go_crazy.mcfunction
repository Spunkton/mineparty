# Hardcoded title card

# Set to instant appearance instant
title @a reset
execute as @a at @s run playsound minecraft:entity.generic.explode record @s ^ ^ ^1 0.7 1

# Play some tunes
function mineparty:music/play {song:minigame}

# Summon fireworks
execute at @a run summon firework_rocket ~ ~4 ~ {LifeTime:1,FireworksItem:{id:"minecraft:firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:"large_ball",has_twinkle:true,colors:[I;16711680]}]}}}}
effect give @a minecraft:resistance 1 10 true

# Start to set turn order
schedule function mineparty:game/start/turn_order 60t