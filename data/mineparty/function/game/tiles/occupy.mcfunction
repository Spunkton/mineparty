# Executed as player, who will occupy the nearest tile

# Remove occupation first
function mineparty:game/tiles/remove_occupation with entity @s

# Add occupation to nearest tile
data modify entity @n[tag=tile] data.occupied append value {UUID:[I;1,1,1,1]}
data modify entity @n[tag=tile] data.occupied[{UUID:[I;1,1,1,1]}].UUID set from entity @s UUID

# Set spawn to nearest tile
execute at @n[tag=tile] run spawnpoint @s

# Update the tile so the indicator shows
tag @n[tag=tile] add update