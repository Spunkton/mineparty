advancement revoke @s only mineparty:game/items/evoker_trap

# Tag tile currently on
function mineparty:game/tiles/tag_current with entity @s

# If tile is already laced
execute if data entity @n[tag=tile,tag=current] data.modifiers[{id:"poison"}] unless entity @s[gamemode=creative] run function mineparty:game/items/evoker_trap/give
execute if data entity @n[tag=tile,tag=current] data.modifiers[{id:"poison"}] run tellraw @s {"color":"red","text":"Tile is already laced!"}
execute if data entity @n[tag=tile,tag=current] data.modifiers[{id:"poison"}] run return run tag @n[tag=tile,tag=current] remove current

# Add poison and data related to poison
data modify entity @n[tag=tile,tag=current] data.modifiers append value {id:"poison",UUID:[]}
data modify entity @n[tag=tile,tag=current] data.modifiers[{id:"poison"}].UUID set from entity @s UUID

# Tell self
tellraw @s {"color":"gray","text":"A cold wind brushes the tile..."}

# Particles
execute at @n[tag=tile,tag=current] run particle effect{color:[0.314,0.000,0.522],power:1} ~ ~ ~ 0.7 0 0.7 0 50 normal @s

# Remove tag
tag @e[tag=tile] remove current