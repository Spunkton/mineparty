# Teleports to random tile with $(tag), can be on a different map! Watch out!
$execute at @n[sort=random,tag=tile,tag=$(tag)] run tp @s ~ ~ ~
$execute unless entity @n[sort=random,tag=tile,tag=$(tag)] at @n[sort=random,tag=tile,tag=redirect_warp] run tp @s ~ ~ ~