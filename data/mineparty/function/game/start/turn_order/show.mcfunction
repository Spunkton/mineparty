# Shows turn order, including whose turn it is.
# Executed as player being shown to

# Score and data setup
scoreboard players set #turn_order_line mineparty 1
data modify storage mineparty:temp turn_order set from storage mineparty:main turn_order

# Title
tellraw @s "\u00a7l========={Turn order}========="

# Show lines
function mineparty:game/start/turn_order/show/line

# End with divider
tellraw @s "=================================="

# Clean up
data remove storage mineparty:temp turn_order