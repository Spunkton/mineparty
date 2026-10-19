# Ends minigame

# Stops schedule
schedule clear mineparty:minigames/minigames/updraft/tick
function mineparty:timer/abort

# Game over!
title @a title "Game over!"

# Rank everyone
execute as @a[tag=!not_playing] run function mineparty:minigames/minigames/updraft/end/rank
### Little message
execute as @a[tag=!not_playing] run tellraw @s ["",{"color":"gold","text":"Your final score"},{"color":"gray","text":": "},{"color":"white","score":{"objective":"minigames","name":"@s"}}]

# Store highscore
scoreboard players operation #highscore_updraft mineparty > @a minigames

# Clean up
### Entities
kill @e[tag=updraft_resource]
kill @e[tag=updraft_altometer_display]
### Effects
effect clear @a minecraft:resistance
### Attributes
execute as @a run attribute @s minecraft:jump_strength base reset
### Gamerules
execute if score #gamerule_fall_damage mineparty matches 1 run gamerule fall_damage true
execute if score #gamerule_pvp mineparty matches 0 run gamerule pvp false

# Back to main end function
schedule function mineparty:minigames/end 3s