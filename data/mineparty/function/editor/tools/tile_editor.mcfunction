advancement revoke @s only mineparty:editor/tools/tile_editor

# Add selected tag tile you're looking at
function mineparty:editor/tag_selected

# Cancel if no tiles are selected
execute unless entity @n[tag=selected] run title @s actionbar {"color":"red","text":"No tiles selected"}
execute unless entity @n[tag=selected] run return 0

# Set data
data modify entity @n[tag=selected] data.name set from entity @n[tag=selected] CustomName
data modify entity @n[tag=selected] data.UUID set from entity @n[tag=selected] UUID

# Open dialog (default)
execute unless predicate mineparty:sneaking run function mineparty:editor/tools/tile_editor/dialog with entity @n[tag=selected] data

# Open dialog (special)
### Cancel if no special settings
execute if predicate mineparty:sneaking as @n[type=marker,tag=selected] unless function mineparty:map/tiles/specific_check run tellraw @p {"color":"red","text":"Tile type has no special settings."}
execute if predicate mineparty:sneaking as @n[type=marker,tag=selected] unless function mineparty:map/tiles/specific_check run return run tag @e remove selected
execute if predicate mineparty:sneaking run function mineparty:editor/tools/tile_editor/special with entity @n[tag=selected] data

# Remove selected tag
tag @e remove selected