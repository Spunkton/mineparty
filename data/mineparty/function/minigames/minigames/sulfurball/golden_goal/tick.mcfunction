# Scoreboard flashing
scoreboard players operation #flash minigames = timer mineparty
function mineparty:other/calc/mod {input:"#flash minigames",amount:2}
execute if score #flash minigames matches 0 as @e[tag=sulfurball_scoreboard_display] run data modify entity @s text set value {"color":"gold","text":"OVERTIME"}
execute if score #flash minigames matches 1 as @e[tag=sulfurball_scoreboard_display] run data modify entity @s text set value {"color":"white","text":"OVERTIME"}

# Trail for the sulfur cube
execute at @n[tag=sulfur_ball] run particle minecraft:wax_on ~ ~ ~ 0 0 0 0 1