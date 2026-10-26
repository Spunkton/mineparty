# Gets one line at a time

# Shows one line
function mineparty:game/start/turn_order/show/line_with_id with storage mineparty:temp turn_order[0]

# Remove and tick up
data remove storage mineparty:temp turn_order[0]
scoreboard players add #turn_order_line mineparty 1

# Recurs if there is stuff left to say
execute if data storage mineparty:temp turn_order[0] run return run function mineparty:game/start/turn_order/show/line