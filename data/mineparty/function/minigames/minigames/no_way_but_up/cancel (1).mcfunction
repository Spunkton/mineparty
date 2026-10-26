# Ends the minigame without any winners

# Clear schedule
schedule clear mineparty:minigames/minigames/no_way_but_up/tick
schedule clear mineparty:minigames/minigames/no_way_but_up/update

# Clean up (from end function)
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