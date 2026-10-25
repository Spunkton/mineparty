advancement revoke @s only mineparty:editor/tools/tile_eraser

# Add selected tag tile you're looking at
function mineparty:editor/tag_selected

# Replace blocks if sneaking
execute unless predicate mineparty:sneaking at @n[tag=selected] run function mineparty:editor/tools/tile_eraser/blend_in

# Delete tile
execute as @n[tag=selected] at @s run function mineparty:editor/tiles/delete with entity @s