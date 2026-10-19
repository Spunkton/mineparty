advancement revoke @s only mineparty:editor/tools/tag_editor

# Add selected tag tile you're looking at
function mineparty:editor/tag_selected

# Alternate function if sneaking
execute if predicate mineparty:sneaking run function mineparty:editor/tools/tag_editor/copy
execute if predicate mineparty:sneaking run return run tag @e remove selected

# Cancel if no tiles are selected
execute unless entity @n[tag=selected] run title @s actionbar {"color":"red","text":"No tiles selected."}
execute unless entity @n[tag=selected] run return 0

# Alternate function if pasting
execute if items entity @s weapon.mainhand *[minecraft:custom_data~{tags:["tile"]}] run data modify entity @n[tag=selected] Tags set from entity @s SelectedItem.components."minecraft:custom_data".tags
execute if items entity @s weapon.offhand *[minecraft:custom_data~{tags:["tile"]}] run data modify entity @n[tag=selected] Tags set from entity @s equipment.offhand.components."minecraft:custom_data".tags
execute if items entity @s weapon.* *[minecraft:custom_data~{tags:["tile"]}] run return run tag @e remove selected

# Set data
data modify entity @n[tag=selected] data.temp.UUID set from entity @n[tag=selected] UUID
data modify entity @n[tag=selected,tag=no_diamond] data.temp.no_diamond set value "true"
data modify entity @n[tag=selected,tag=!no_diamond] data.temp.no_diamond set value "false"
data modify entity @n[tag=selected,tag=no_warp] data.temp.no_warp set value "true"
data modify entity @n[tag=selected,tag=!no_warp] data.temp.no_warp set value "false"
data modify entity @n[tag=selected,tag=no_passage] data.temp.no_passage set value "true"
data modify entity @n[tag=selected,tag=!no_passage] data.temp.no_passage set value "false"
data modify entity @n[tag=selected] data.temp.other set value []

summon marker ~ ~ ~ {Tags:[],CustomName:"temp_data"}
data modify entity @n[type=marker,name=temp_data] Tags set from entity @n[tag=selected] Tags
tag @n[type=marker,name=temp_data] remove selected
tag @n[type=marker,name=temp_data] remove tile
tag @n[type=marker,name=temp_data] remove pointed
tag @n[type=marker,name=temp_data] remove no_diamond
tag @n[type=marker,name=temp_data] remove no_warp
tag @n[type=marker,name=temp_data] remove no_passage
tag @n[type=marker,name=temp_data] remove occupied

data modify entity @n[tag=selected] data.temp.other set from entity @n[type=marker,name=temp_data] Tags

# Open dialog
function mineparty:editor/tools/tag_editor/dialog with entity @n[tag=selected] data.temp

# Clean up
tag @e remove selected
kill @n[type=marker,name=temp_data]