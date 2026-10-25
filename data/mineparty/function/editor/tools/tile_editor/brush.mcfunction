advancement revoke @s only mineparty:editor/tools/tile_editor/brush

# Add selected tag tile you're looking at
function mineparty:editor/tag_selected

# Cancel if no tiles are selected
execute unless entity @n[tag=selected] run title @s actionbar {"color":"red","text":"No tiles selected"}
execute unless entity @n[tag=selected] run return 0

# Change tile to data from brush
function mineparty:editor/tiles/paste with entity @s SelectedItem.components."minecraft:custom_data".brush

# Remove selected tag
tag @e remove selected