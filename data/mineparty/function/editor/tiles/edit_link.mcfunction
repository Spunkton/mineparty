# Edits link type and data between $(from) and $(to)
# Needs UUID of $(from), $(to), and needs $(type) and $(amount)

# Set data
$data modify entity @n[type=marker,tag=tile,nbt={UUID:$(from)}] data.links[{UUID:$(to)}].type set value "$(type)"
$data modify entity @n[type=marker,tag=tile,nbt={UUID:$(from)}] data.links[{UUID:$(to)}].amount set value $(amount)

# If its reset to default
$data remove entity @n[type=marker,tag=tile,nbt={UUID:$(from)}] data.links[{UUID:$(to),type:"default"}].amount
$data remove entity @n[type=marker,tag=tile,nbt={UUID:$(from)}] data.links[{UUID:$(to),type:"default"}].type

# Update tile
$tag @n[type=marker,tag=tile,nbt={UUID:$(to)}] add update