# Needs $(name), $(type), $(block), $(map), and $(UUID)
# Executed as nearest to tile

$data merge entity @n[type=marker,tag=tile,nbt={UUID:$(UUID)}] {CustomName:"$(name)",data:{type:"$(type)",name:"$(name)",block:"$(block)",map:"$(map)"}}
$data remove entity @n[type=marker,tag=tile,nbt={UUID:$(UUID)}] data.special

# Changes the block bottom
$execute at @n[type=marker,tag=tile,nbt={UUID:$(UUID)}] run fill ~-1 ~-1 ~-1 ~1 ~-1 ~1 $(block)

# Poof!
$execute at @n[type=marker,tag=tile,nbt={UUID:$(UUID)}] run particle crit ~ ~0.5 ~ 0.5 0 0.5 0 15 normal