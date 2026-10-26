# Loads from save

# Load data
data modify entity @s data set from entity @s data.save

# Load name
data modify entity @s CustomName set from entity @s data.name

# And save again
function mineparty:map/tiles/save