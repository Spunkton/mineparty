# Diamond block
function mineparty:map/indicator/diamond/big

# Orbiting diamonds
function mineparty:map/indicator/diamond/rings

# Floor
function mineparty:map/indicator/diamond/floor

# Set teleport duration
execute as @e[tag=diamond_indicator] at @s run data modify entity @s teleport_duration set value 4
