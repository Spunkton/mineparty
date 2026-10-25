# Summons rays until it hits a block (max $(length) in length)
# Expensive = steps of 0.125 distance

# Set max length
$scoreboard players set #max_raycast_length mineparty $(length)
function mineparty:other/calc/mult {input:"#max_raycast_length mineparty",amount:8}
scoreboard players set #raycast_length mineparty 0

# Start ray recursive function
function mineparty:other/raycast/expensive/step

# Clean up
kill @e[tag=ray,tag=!in_block]