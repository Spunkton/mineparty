# Cancel function from Sulfurball
# These are mandatory, these run when a game is canceltld, or a minigame is cancelled.

# Ends minigame immediately without winners

# Stops schedule
schedule clear mineparty:minigames/minigames/sulfurball/tick
schedule clear mineparty:minigames/minigames/sulfurball/goal/return
function mineparty:timer/cancel

# Clean up
### Entities
tp @e[tag=sulfur_ball] 0 -100 0
### Scoreboard
scoreboard players reset * minigames_teams
### Teams
team leave @a[tag=!not_playing]
### Effects
effect clear @a minecraft:resistance