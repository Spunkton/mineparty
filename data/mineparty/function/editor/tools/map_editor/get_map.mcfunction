# Needs $(map)

# Error stuff
### Dead end
$execute as @e[type=marker,tag=tile,nbt={data:{map:"$(map)"}}] unless data entity @s data.links[] run tellraw @p "\u00a7cCannot save map \"$(map)\": Dead end found!"
$execute as @e[type=marker,tag=tile,nbt={data:{map:"$(map)"}}] unless data entity @s data.links[] run return 0
### No starting tile
$execute unless entity @n[type=marker,tag=tile,tag=start,nbt={data:{map:"$(map)"}}] run tellraw @p "\u00a7cCannot save map \"$(map)\": No starting tile!"
$execute unless entity @n[type=marker,tag=tile,tag=start,nbt={data:{map:"$(map)"}}] run return 0

# Go to dialog
$execute unless data storage mineparty:maps maps.$(map) run function mineparty:editor/tools/map_editor/create_data {map:"$(map)"}
$execute if data storage mineparty:maps maps.$(map) run function mineparty:editor/tools/map_editor/dialog with storage mineparty:maps maps.$(map)