# Teleports to random tile in same $(map)
$execute at @n[tag=tile,tag=$(tag),tag=lucky_warp] run tp @s ~ ~ ~
$execute unless entity @n[tag=tile,tag=$(tag),tag=lucky_warp] run execute at @n[tag=tile,tag=lucky_warp] run tp @s ~ ~ ~