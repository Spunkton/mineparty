# Remove tag for taking turn
tag @a remove taking_turn

# Add to turn count
scoreboard players add turn mineparty 1
execute store result storage mineparty:main turn.number int 1 run scoreboard players operation turn mineparty %= player_count mineparty

# Tag player taking turn
function mineparty:game/round/turn/get_id with storage mineparty:main turn
data modify storage mineparty:main turn.phase set value -1
execute store success score #fail_check mineparty run function mineparty:game/round/turn/tag with storage mineparty:main turn
execute if score #fail_check mineparty matches 0 run return fail
data modify storage mineparty:main turn.phase set value 0

# Start new round if turn is back to 0
execute if score turn mineparty matches 0 run function mineparty:game/round/begin

# Tell everyone
tellraw @a[tag=!taking_turn] ["\u00a7aIt's ",{"selector":"@p[tag=taking_turn]"},"\u00a7a's turn!"]
tellraw @p[tag=taking_turn] "\u00a7aIt's your turn!"
effect give @p[tag=taking_turn] minecraft:glowing infinite 0 true
advancement grant @p[tag=taking_turn] only mineparty:toast/your_turn
execute if score round mineparty matches 1 run tellraw @p[tag=taking_turn] "Roll the die to move, or use other items first."
execute unless score turn mineparty matches 0 run title @p[tag=taking_turn] title ""
title @p[tag=taking_turn] subtitle "You're up!"

# Set up the wait_for_roll
data modify storage mineparty:main wait_for_roll_message.dice set value "Roll a die to move!"
data modify storage mineparty:main wait_for_roll_message.no_dice set value "\u00a76It's your turn"
data modify storage mineparty:main command_queue set value ["function mineparty:game/tiles/move","function mineparty:map/tiles/function with entity @n[tag=landed_on] data","function mineparty:game/round/turn/end"]
### Tags and scores
tag @a add rolled_dice
scoreboard players reset * dice_roll
tag @p[tag=taking_turn] remove rolled_dice
function mineparty:game/dice/wait_for_roll