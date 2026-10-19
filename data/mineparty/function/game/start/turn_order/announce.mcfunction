# Declares a list basically
function mineparty:game/start/turn_order/announce_line with storage mineparty:main turn_order_announcement[0]
data remove storage mineparty:main turn_order_announcement[0]
scoreboard players add #announcement_line mineparty 1

# Loops if there is stuff left to say
execute if data storage mineparty:main turn_order_announcement[0] run schedule function mineparty:game/start/turn_order/announce 1t
# Ends with a divider if not
execute unless data storage mineparty:main turn_order_announcement[0] run tellraw @a "=================================="

# For the start of the game
execute if score round mineparty matches 0 unless data storage mineparty:main turn_order_announcement[0] run schedule function mineparty:command_queue 3s