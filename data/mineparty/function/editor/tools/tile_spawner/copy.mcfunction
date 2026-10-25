# Copy the tile looked at

# Add selected tag tile you're looking at
function mineparty:editor/tag_selected

# Set blank if sneaking or if no tiles are selected
execute if predicate mineparty:sneaking run function mineparty:editor/tools/tile_spawner/clear
execute if predicate mineparty:sneaking run return run tag @e[tag=tile] remove selected
execute unless entity @n[tag=selected] run function mineparty:editor/tools/tile_spawner/clear
execute unless entity @n[tag=selected] run return run tag @e[tag=tile] remove selected


# Copy selected tile and replace your current with it
### Summon tile spawner item
function mineparty:editor/tiles/get with entity @n[tag=selected] data

# Replace current item 
item replace entity @s weapon.mainhand from entity @n[tag=give_item] container.0

# Kill item
kill @n[tag=give_item]

# Effects
playsound minecraft:ui.loom.take_result player @s ~ ~ ~ 0.6 2
execute at @n[tag=selected] run particle instant_effect{color:[1.000,1.000,1.000]} ~ ~ ~ 0.75 0 0.75 0 32 normal @s

# Notify
tellraw @s[tag=debug] {"color":"gray","text":"Copied Tile."}

# Clean up
tag @e[tag=tile] remove selected