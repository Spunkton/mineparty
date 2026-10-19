# Ends minigame

# Stops schedule
function mineparty:timer/abort

# Score everyone
execute as @a[tag=!not_playing] run function mineparty:minigames/minigames/pigment_perfect/score
### Rank everyone
execute as @a[tag=!not_playing] run function mineparty:minigames/minigames/pigment_perfect/end/rank

# Store highscore
execute unless score #highscore_pigment_perfect mineparty matches -1.. run scoreboard players set #highscore_pigment_perfect mineparty 40000
scoreboard players operation #highscore_pigment_perfect mineparty < @a[tag=!not_playing] minigames

# Put everyone in adventure again
gamemode adventure @a[tag=!not_playing]

# Remove teams
team leave @a[tag=!not_playing]

# Back to main end function
schedule function mineparty:minigames/end 3s