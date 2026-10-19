# Removes occupation

# Update tile
$tag @e[type=marker,tag=tile,nbt={data:{occupied:[{UUID:$(UUID)}]}}] add update

# Needs UUID from player who gets occupation removed
$execute as @e[type=marker,tag=tile,nbt={data:{occupied:[{UUID:$(UUID)}]}}] run data remove entity @s data.occupied[{UUID:$(UUID)}]