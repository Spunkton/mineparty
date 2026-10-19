# Summons marker to store ids before continuing to link
summon marker ~ ~ ~ {Tags:["store_id"]}
$data modify entity @n[tag=store_id,type=marker] data.from set value $(pivot)
data modify entity @n[tag=store_id,type=marker] data.to set from entity @n[tag=selected] UUID
function mineparty:editor/tools/tile_linker/link with entity @n[tag=store_id] data

# Clean up
tag @e[type=marker,tag=tile] remove linking
kill @e[tag=store_id]