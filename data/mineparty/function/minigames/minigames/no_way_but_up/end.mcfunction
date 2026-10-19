# Ends minigame

# Stops schedule
schedule clear mineparty:minigames/minigames/no_way_but_up/tick

# Game over!
title @a title "Game over!"

# Show score
tellraw @a ["",{"color":"gold","text":"Final score"},{"color":"gray","text":": "},{"color":"white","score":{"name":"#nwbu_clouds","objective":"mineparty"}}]

# Store highscore
scoreboard players operation #highscore_no_way_but_up mineparty > #nwbu_clouds mineparty

# Clean up
### Visuals
bossbar remove mineparty:no_way_but_up
### Entities
kill @e[tag=nwbu_cloud]
stopsound @a * minecraft:entity.happy_ghast.harness_goggles_up
stopsound @a * minecraft:entity.happy_ghast.harness_goggles_down
### Scoreboard
scoreboard objectives remove y_level
scoreboard players reset * minigames
### Teams
team leave @a[tag=!not_playing]
### Effects
effect clear @a minecraft:invisibility

# Put everyone in adventure again
gamemode adventure @a[tag=!not_playing]

# Back to main end function
schedule function mineparty:minigames/end 3s