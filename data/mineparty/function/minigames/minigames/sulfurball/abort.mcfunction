# Ends minigame without winners

# Stops schedule
schedule clear mineparty:minigames/minigames/sulfurball/tick
schedule clear mineparty:minigames/minigames/sulfurball/goal/return
function mineparty:timer/abort

# Clean up
### Entities
tp @e[tag=sulfur_ball] 0 -100 0
### Scoreboard
scoreboard players reset * minigames_teams
### Teams
team leave @a[tag=!not_playing]
### Effects
effect clear @a minecraft:resistance