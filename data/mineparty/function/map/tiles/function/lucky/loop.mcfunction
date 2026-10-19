# Summons fireworks all around for a bit

# Rotate the anchor
execute at @p[tag=taking_turn] as @n[tag=lucky_warp] at @s run tp @s ~ ~ ~ ~15 0

# Summon fireworks
execute at @p[tag=taking_turn] rotated as @n[tag=lucky_warp] run summon firework_rocket ^ ^ ^6 {Glowing:1b,LifeTime:40,Tags:["lucky_rocket"],FireworksItem:{id:"minecraft:firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:"star",has_twinkle:true,has_trail:true,colors:[I;16711680,16776960,65280,65535,255,16711935],fade_colors:[I;11075551]}]}}}}

# Tick down
scoreboard players remove #lucky_animation mineparty 1

# Schedule self
execute if score #lucky_animation mineparty matches 1.. run schedule function mineparty:map/tiles/function/lucky/loop 4t