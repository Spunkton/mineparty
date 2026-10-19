# End function from Sulfurball
# Not mandatory
# Usually copies a lot from the abort function
# Note that *actually* ending the minigame (eg. removing the "playing_minigame" data from the main storage) is not scheduled by default! You have to add it to the end function (or somewhere else).

# Ends minigame

# Check if it needs to enter golden goal phase
execute if score Pink minigames_teams = Blue minigames_teams unless score #golden_goal minigames matches 1 run function mineparty:minigames/minigames/sulfurball/golden_goal
execute if score Pink minigames_teams = Blue minigames_teams unless score #golden_goal minigames matches 1 store success score #golden_goal minigames run return 1

# Stops schedule
schedule clear mineparty:minigames/minigames/sulfurball/tick
schedule clear mineparty:minigames/minigames/sulfurball/goal/return
function mineparty:timer/abort

# Signal
title @a title "Game over!"

# Show score
tellraw @a ["",{"color":"gold","text":"Final score"},{"color":"gray","text":": "},{"color":"light_purple","score":{"name":"Pink","objective":"minigames_teams"}},"-",{"color":"aqua","score":{"name":"Blue","objective":"minigames_teams"}}]

# Mark who won and lost
scoreboard players set @a[tag=!not_playing] minigames_rank -2
execute if score Pink minigames_teams > Blue minigames_teams run scoreboard players set @a[team=Pink] minigames_rank 0
execute if score Pink minigames_teams > Blue minigames_teams run scoreboard players set @a[team=Blue] minigames_rank -2
execute if score Pink minigames_teams < Blue minigames_teams run scoreboard players set @a[team=Pink] minigames_rank -2
execute if score Pink minigames_teams < Blue minigames_teams run scoreboard players set @a[team=Blue] minigames_rank 0
execute if score Pink minigames_teams = Blue minigames_teams run scoreboard players set @a[tag=!not_playing] minigames_rank -1

# Clean up
### Entities (with flair)
execute at @n[tag=sulfur_ball] run particle minecraft:end_rod ~ ~ ~ 0 0 0 0.15 250
execute at @n[tag=sulfur_ball] run playsound minecraft:entity.dragon_fireball.explode block @a ~ ~ ~ 0.4 2 0.2
tp @e[tag=sulfur_ball] 0 -100 0
### Scoreboard
scoreboard players reset * minigames_teams
### Teams
team leave @a[tag=!not_playing]
### Effects
effect clear @a minecraft:resistance

# Put everyone in adventure again
gamemode adventure @a[tag=!not_playing]

# Back to main end function <------------ DOES NOT HAPPEN BY DEFAULT
schedule function mineparty:minigames/end 3s