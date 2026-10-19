# Executed as player, who occupies the current tile
# Current tile is either the occupied tile or the tile you're currently on if moving.
# Needs $(UUID)

execute if entity @s[tag=moving] run tag @n[tag=tile,tag=move_from] add current
execute if entity @s[tag=moving] run return 1

$tag @n[tag=tile,nbt={data:{occupied:[{UUID:$(UUID)}]}}] add current
return 2