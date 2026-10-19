# Remove relevant tags
tag @a remove doesnt_roll
tag @a remove ordered
tag @a remove highest

# Reset turn order data
data modify storage mineparty:main turn_order set value []

# Notify
tellraw @a "<Helper> Roll the die to decide turn order!"

# Run function
function mineparty:game/start/turn_order/prompt