advancement revoke @s only mineparty:editor/tools/tile_linker

# Remove old tags
tag @s remove pleasedontremovemypivotimmediately

# Add selected tag to tile you're looking at
function mineparty:editor/tag_selected

# Cancel if no tiles are selected
execute unless entity @n[tag=selected] run title @s actionbar {"color":"red","text":"No tiles selected."}
execute unless entity @n[tag=selected] run return 0

# Cancel if not in mainhand
execute unless items entity @s weapon.mainhand *[minecraft:custom_data~{tile_linker:true}] run title @s actionbar {"color":"red","text":"Put linker in mainhand."}
execute unless items entity @s weapon.mainhand *[minecraft:custom_data~{tile_linker:true}] run return 0

# Add pivot if there isn't any
execute unless data entity @s SelectedItem.components."minecraft:custom_data".pivot run function mineparty:editor/tools/tile_linker/pivot

# Otherwise link nearest
execute if data entity @s[tag=!pleasedontremovemypivotimmediately] SelectedItem.components."minecraft:custom_data".pivot run function mineparty:editor/tools/tile_linker/remove_pivot_if with entity @s SelectedItem.components."minecraft:custom_data"
execute if data entity @s[tag=!pleasedontremovemypivotimmediately] SelectedItem.components."minecraft:custom_data".pivot run function mineparty:editor/tools/tile_linker/link_ids with entity @s SelectedItem.components."minecraft:custom_data"

# Remove tags
tag @e remove selected
tag @s remove pleasedontremovemypivotimmediately