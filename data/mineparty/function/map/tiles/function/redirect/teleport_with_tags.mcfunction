# Teleports to random tile with $(tags), can be on a different map! Watch out!
$execute at @n[sort=random,tag=tile,tag=$(tags)] run tp @s ~ ~ ~
$execute unless entity @n[sort=random,tag=tile,tag=$(tags)] at @n[sort=random,tag=tile,tag=redirect_warp] run tp @s ~ ~ ~