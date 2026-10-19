advancement revoke @s only mineparty:editor/tools/start_marker

# Remove old start
execute unless predicate mineparty:sneaking run function mineparty:editor/tools/remove_start with entity @n[tag=tile] data

# Add selected tag tile you're looking at
function mineparty:editor/tag_selected

# Remove starting tile if not looking at a tile
execute unless entity @n[tag=selected] run function mineparty:editor/tools/remove_start with entity @n[tag=tile] data

# Set as new start
tag @n[tag=selected] add start

# Notify
execute unless predicate mineparty:sneaking run tellraw @s "Starting tile marked."
execute if predicate mineparty:sneaking run tellraw @s "Extra starting tile added."
execute unless entity @n[tag=selected] run tellraw @s {"color":"red","text":"Starting tile removed."}

# Remove selected tag
tag @e remove selected