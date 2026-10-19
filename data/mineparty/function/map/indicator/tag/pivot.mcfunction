# Summons item to copy item to so it's not as heavy on the game

# Summon item
summon item ~ ~ ~ {Tags:["pivot_data"],Item:{id:"stone"}}

# Copy over item
item replace entity @n[tag=pivot_data] container.0 from entity @s weapon.mainhand

# Run function
function mineparty:editor/tools/tile_linker/show_pivot with entity @n[tag=pivot_data] Item.components."minecraft:custom_data"

# Clean up
kill @n[tag=pivot_data]