advancement revoke @s only mineparty:editor/tools/map_editor

# Add selected tag tile you're looking at
function mineparty:editor/tag_selected

# Cancel if no tiles are selected
execute unless entity @n[tag=selected] run title @s actionbar {"color":"red","text":"No tiles selected"}
execute unless entity @n[tag=selected] run return 0

# Open dialog
function mineparty:editor/tools/map_editor/get_map with entity @n[tag=selected] data

# Remove selected tag
tag @e[type=marker,tag=tile] remove selected