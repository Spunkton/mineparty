# Summons rays until it hits a block (max $(length) in length)
# Medium = steps of 0.5 distance

# Set max length
$scoreboard players set #max_raycast_length mineparty $(length)
$scoreboard players add #max_raycast_length mineparty $(length)
scoreboard players set #raycast_length mineparty 0

# Start ray recursive function
function mineparty:other/raycast/medium/step

# Clean up
kill @e[tag=ray,tag=!in_block]