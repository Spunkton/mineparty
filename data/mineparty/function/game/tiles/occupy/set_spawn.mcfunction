# Executed as player
# Needs $(UUID)

# Set spawnpoint
$execute at @n[type=marker,tag=tile,nbt={data:{occupied:[{UUID:$(UUID)}]}}] run spawnpoint @s