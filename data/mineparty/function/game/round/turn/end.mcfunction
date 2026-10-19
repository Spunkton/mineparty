# Remove glowing from turn taker
effect clear @a minecraft:glowing

# Check if it is final turn of the round
scoreboard players operation #turn+1 mineparty = turn mineparty
scoreboard players add #turn+1 mineparty 1
execute if score #turn+1 mineparty = player_count mineparty run function mineparty:game/round/end
execute if score #turn+1 mineparty = player_count mineparty run return 1

# Maybe some shenanigans
function mineparty:game/round/turn/shenanigans

# Otherwise, continue on to next turn
function mineparty:game/round/turn/begin