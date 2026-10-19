# Don't move when someone else is already moving!

# If no player is taking their turn (absentee)
execute unless entity @p[tag=taking_turn] run function mineparty:game/player/absentee with storage mineparty:main turn
execute unless entity @p[tag=taking_turn] run return fail

# Set turn phase
data modify storage mineparty:main turn.phase set value 1

# Tags
tag @a remove moving
tag @p[tag=taking_turn] add moving
function mineparty:game/tiles/move/tag_occupied with entity @p[tag=taking_turn]

# Move to occupied
execute as @p[tag=taking_turn] run function mineparty:game/tiles/tp_to_occupied with entity @p[tag=taking_turn]

# Set score
scoreboard players operation #steps mineparty = @p[tag=taking_turn] dice_roll
scoreboard players operation #initial_steps mineparty = @p[tag=taking_turn] dice_roll

# Run loop
function mineparty:game/tiles/move/loop