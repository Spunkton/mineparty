# Prepares macros in dialog
# Needs UUIDs $(from) and $(to)

# Summon data holder
$summon marker ~ ~ ~ {Tags:["dialog_data"],data:{from:$(from),to:$(to),amount:5,type:"default",key:false,super_key:false,toll:false,barrier:false}}

# Get data from tile link
$data modify entity @n[tag=dialog_data] data.type set from entity @n[type=marker,tag=tile,nbt={UUID:$(from)}] data.links[{UUID:$(to)}].type
$data modify entity @n[tag=dialog_data] data.amount set from entity @n[type=marker,tag=tile,nbt={UUID:$(from)}] data.links[{UUID:$(to)}].amount
### Get type
$execute as @n[type=marker,tag=tile,nbt={UUID:$(from)}] if data entity @s data.links[{UUID:$(to),type:key}] run data modify entity @n[type=marker,tag=dialog_data] data.key set value true
$execute as @n[type=marker,tag=tile,nbt={UUID:$(from)}] if data entity @s data.links[{UUID:$(to),type:super_key}] run data modify entity @n[type=marker,tag=dialog_data] data.super_key set value true
$execute as @n[type=marker,tag=tile,nbt={UUID:$(from)}] if data entity @s data.links[{UUID:$(to),type:toll}] run data modify entity @n[type=marker,tag=dialog_data] data.toll set value true
$execute as @n[type=marker,tag=tile,nbt={UUID:$(from)}] if data entity @s data.links[{UUID:$(to),type:barrier}] run data modify entity @n[type=marker,tag=dialog_data] data.barrier set value true

# Show dialog
function mineparty:editor/tools/tile_linker/dialog with entity @n[type=marker,tag=dialog_data] data

# Clean up
kill @e[type=marker,tag=dialog_data]