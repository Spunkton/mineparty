# Link using UUIDs $(from) and $(to)

# Link
$execute unless data entity @n[type=marker,tag=tile,nbt={UUID:$(from)}] data.links[{UUID:$(to)}] run title @s actionbar "Linked!"
$execute unless data entity @n[type=marker,tag=tile,nbt={UUID:$(from)}] data.links[{UUID:$(to)}] run tag @n[type=marker,tag=tile,nbt={UUID:$(from)}] add linking
$execute unless data entity @n[type=marker,tag=tile,nbt={UUID:$(from)}] data.links[{UUID:$(to)}] run data modify entity @n[type=marker,tag=tile,nbt={UUID:$(from)}] data.links append value {UUID:$(to)}

# Edit if shifting
$execute if predicate mineparty:sneaking if data entity @n[type=marker,tag=tile,nbt={UUID:$(from)}] data.links[{UUID:$(to)}] run function mineparty:editor/tools/tile_linker/dialog_setup {from:$(from),to:$(to)}
$execute if predicate mineparty:sneaking if data entity @n[type=marker,tag=tile,nbt={UUID:$(from)}] data.links[{UUID:$(to)}] run return 1

# Unlink
$execute if data entity @n[type=marker,tag=tile,nbt={UUID:$(from)},tag=!linking] data.links[{UUID:$(to)}] run title @s actionbar "Unlinked!"
$data remove entity @n[type=marker,tag=tile,nbt={UUID:$(from)},tag=!linking] data.links[{UUID:$(to)}]