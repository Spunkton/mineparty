# Teleports to random tile in same $(map)
$execute at @n[sort=random,tag=tile,nbt={data:{map:"$(map)"}},tag=!no_warp,tag=!diamond,tag=landed_on] run tp @s ~ ~ ~