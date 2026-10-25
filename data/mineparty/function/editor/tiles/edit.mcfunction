# Needs $(name), $(type), $(block), $(map), $(command), $(description), and $(UUID)
# Executed as nearest to tile

# Check if tile type is valid
$execute unless data storage mineparty:main {enum:{map:{tiles:{valid:["$(type)"]}}}} run tellraw @s {"color":"red","text":"Type \"$(type)\" is not a valid tile type."}
$execute unless data storage mineparty:main {enum:{map:{tiles:{valid:["$(type)"]}}}} run return fail

# Set data
$data merge entity @n[type=marker,tag=tile,nbt={UUID:$(UUID)}] {CustomName:"$(name)",data:{type:"$(type)",name:"$(name)",block:"$(block)",map:"$(map)",command:"$(command)",description:"$(description)"}}

# Changes the block bottom if the tile is just made of a single block
$execute at @n[type=marker,tag=tile,nbt={UUID:$(UUID)}] if blocks ~-1 ~-1 ~-1 ~1 ~-1 ~ ~-1 ~-1 ~ all if blocks ~-1 ~-1 ~-1 ~ ~-1 ~1 ~ ~-1 ~-1 all run fill ~-1 ~-1 ~-1 ~1 ~-1 ~1 $(block)

# Poof!
$execute at @n[type=marker,tag=tile,nbt={UUID:$(UUID)}] run particle crit ~ ~0.5 ~ 0.5 0 0.5 0 15 normal