# Teleports to tile with tag $(tags)
$execute at @n[tag=tile,tag=$(tags),tag=lucky_warp] run tp @s ~ ~ ~
$execute unless entity @n[tag=tile,tag=$(tags),tag=lucky_warp] run execute at @n[tag=tile,tag=lucky_warp] run tp @s ~ ~ ~