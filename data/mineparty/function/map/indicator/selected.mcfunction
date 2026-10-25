# Summon raycast to find nearest to vision (executed as player editing)

# Tag selected tile
function mineparty:editor/tag_selected

# Tag self
tag @s add self

# Give pointed tag
tag @n[tag=selected] add pointed
tag @n[tag=pointed] remove selected

# Show data
execute if items entity @s weapon.mainhand *[minecraft:custom_data~{tile_brush:true}|minecraft:custom_data~{start_marker:true}] run function mineparty:map/indicator/selected/data with entity @n[tag=pointed] data
execute if items entity @s weapon.mainhand *[minecraft:custom_data~{tile_editor:true}] unless predicate mineparty:sneaking run function mineparty:map/indicator/selected/data_detailed with entity @n[tag=pointed] data
execute if items entity @s weapon.mainhand *[minecraft:custom_data~{tile_editor:true}] if predicate mineparty:sneaking run function mineparty:map/indicator/selected/specific_check with entity @n[tag=pointed] data
execute if items entity @s weapon.mainhand *[minecraft:custom_data~{tag_editor:true}] as @n[tag=pointed] run function mineparty:map/indicator/selected/tags

# Warnings
execute if items entity @s weapon.mainhand *[minecraft:custom_data~{tile_linker:true}] if entity @n[tag=pointed,tag=dead_end,tag=!pivot] run title @s actionbar [{"color":"red","text":"This tile is a dead end! Use "},{"keybind":"key.use"}," to add links."]

# Clean up
tag @s remove self