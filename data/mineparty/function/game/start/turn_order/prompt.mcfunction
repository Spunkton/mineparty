# Remove tags
tag @a[tag=!doesnt_roll,tag=!ordered] remove rolled_dice
tag @a remove highest

# Set waiting command to turn_order/get
data modify storage mineparty:main command_queue set value ["function mineparty:game/start/turn_order/get","function mineparty:game/start/after_turn_order"]

# Wait for roll
data modify storage mineparty:main wait_for_roll_message.dice set value "Roll the die!"
data modify storage mineparty:main wait_for_roll_message.no_dice set value "\u00a7cRoll the die!"
function mineparty:game/dice/wait_for_roll
