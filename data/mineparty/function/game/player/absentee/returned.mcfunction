# Continues the game when absentee returns

# Stop waiting
schedule clear mineparty:game/player/absentee/wait_for_return

# Notify
tellraw @a [{"color":"green","text":""},{"color":"white","selector":"@p[scores={left=1..}]"}," has returned! Partying on..."]

# Continue from last recorded phase
# -1 - Before turn
# 0 - Start of turn
# 1 - Moving
# 2 - Landed
### Check phase
execute store result score #turn_phase mineparty run data get storage mineparty:main turn.phase
### Before turn
execute if score #turn_phase mineparty matches -1 run scoreboard players remove turn mineparty 1
execute if score #turn_phase mineparty matches -1 run function mineparty:game/round/turn/begin
### Start of turn
execute if score #turn_phase mineparty matches 0 run data modify storage mineparty:main command_queue set value ["function mineparty:game/tiles/move","function mineparty:map/tiles/function with entity @n[tag=landed_on] data","function mineparty:game/round/turn/end"]
execute if score #turn_phase mineparty matches 0 run tag @a[tag=!taking_turn] add rolled_dice
execute if score #turn_phase mineparty matches 0 run function mineparty:game/dice/wait_for_roll
### Moving
execute if score #turn_phase mineparty matches 1 run scoreboard players operation @p[tag=taking_turn] dice_roll = #initial_steps mineparty
execute if score #turn_phase mineparty matches 1 run function mineparty:game/tiles/move
### Landed
execute if score #turn_phase mineparty matches 2 run function mineparty:map/tiles/function with entity @n[tag=landed_on] data