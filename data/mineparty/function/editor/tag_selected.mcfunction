#Summon raycast to find nearest to vision (executed as player editing)

#Tag self
tag @s add self

#Reset scoreboard first tho
scoreboard players reset * raycast

#Summon raycast
execute anchored eyes run function mineparty:other/summon_raycast
#Tile closest to the most ray points should be selected to the line overall
execute at @e[tag=ray] run scoreboard players add @n[tag=tile,distance=..3] raycast 1
scoreboard players operation #highest raycast > * raycast

#Cancel function if no tiles found
execute if score #highest raycast matches 0 run kill @e[tag=ray]
execute if score #highest raycast matches 0 run tag @s remove self
execute if score #highest raycast matches 0 run return 0

#Give tag
execute as @e[tag=tile] if score @s raycast = #highest raycast at @s run tag @s add selected_candidate
tag @n[tag=selected_candidate] add selected

#Clean up
kill @e[tag=ray]
tag @s remove self
tag @e remove selected_candidate