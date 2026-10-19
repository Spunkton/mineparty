# Runs after both blue and pink goals

# Scream goal
title @a title {"color":"white","text":"GOAL!!!"}
title @a subtitle ["",{"color":"gold","text":"Score"},{"color":"gray","text":": "},{"color":"light_purple","score":{"name":"Pink","objective":"minigames_teams"}},"-",{"color":"aqua","score":{"name":"Blue","objective":"minigames_teams"}}]

tellraw @a ["",{"color":"white","text":"Score"},{"color":"gray","text":": "},{"color":"light_purple","score":{"name":"Pink","objective":"minigames_teams"}},"-",{"color":"aqua","score":{"name":"Blue","objective":"minigames_teams"}}]

# Explode ball
execute at @n[tag=sulfur_ball] run particle minecraft:end_rod ~ ~ ~ 0 0 0 0.15 250
execute at @n[tag=sulfur_ball] run particle minecraft:firework ~ ~ ~ 0 0 0 0.3 125
execute at @n[tag=sulfur_ball] run particle minecraft:wax_on ~ ~ ~ 0 0 0 10 125
execute at @n[tag=sulfur_ball] run playsound minecraft:entity.dragon_fireball.explode block @a ~ ~ ~ 1 2 0.6
execute at @n[tag=sulfur_ball] run playsound minecraft:block.end_portal.spawn block @a ~ ~ ~ 0.3 1 0.2
tp @e[tag=sulfur_ball] 0 -100 0

# Update scoreboards
function mineparty:minigames/minigames/sulfurball/update_scoreboard

# If that was the golden goal
execute if score #golden_goal minigames matches 1 run function mineparty:minigames/minigames/sulfurball/end
execute if score #golden_goal minigames matches 1 run return 1

# Schedule return
schedule function mineparty:minigames/minigames/sulfurball/goal/return 3s