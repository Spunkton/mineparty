# Ends minigame without winners

# Stops schedule
schedule clear mineparty:minigames/minigames/updraft/tick
function mineparty:timer/abort

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