advancement revoke @s only mineparty:game/items/tileporter

# Fail if target is moving
execute if entity @s[tag=moving] run tellraw @s {"color":"red","text":"Can't use this item while moving."}
execute if entity @s[tag=moving,gamemode=!creative] run function mineparty:game/items/tileporter/give
execute if entity @s[tag=moving] run return fail

# Tag tile to teleport to
function mineparty:game/items/tileporter/tag_tile with entity @n[tag=tile,tag=diamond]

# Fail if no tile is found
execute unless entity @n[tag=next_to_diamond] run tellraw @s {"color":"red","text":"No neighbouring tile was found."}
execute unless entity @n[tag=next_to_diamond] unless entity @s[gamemode=creative] run function mineparty:game/items/tileporter/give
execute unless entity @n[tag=next_to_diamond] run return fail

# Fail if no tile is a no_warp tile
execute unless entity @n[tag=next_to_diamond,tag=!no_warp] run tellraw @s {"color":"red","text":"Not allowed to warp to tile."}
execute unless entity @n[tag=next_to_diamond,tag=!no_warp] unless entity @s[gamemode=creative] run function mineparty:game/items/tileporter/give
execute unless entity @n[tag=next_to_diamond,tag=!no_warp] run return fail

# Gay little effects
execute at @s run particle minecraft:enchant ~ ~0.2 ~ 0.25 0 0.25 2 24

# Notif
tellraw @s {"color":"gold","text":"You teleported next to the \u00a7bDiamond\u00a76!"}
tellraw @a[distance=.1..] [{"color":"gold","text":""},{"selector":"@s"}," teleported next to the \u00a7bDiamond\u00a76!"]

# Teleport and occupy tile
tp @s @n[tag=next_to_diamond]
execute at @n[tag=next_to_diamond] run function mineparty:game/tiles/occupy

# More gay little effects
execute at @n[tag=next_to_diamond] run particle minecraft:reverse_portal ~ ~ ~ 0 0 0 0.1 100
execute at @n[tag=next_to_diamond] run particle minecraft:reverse_portal ~ ~ ~ 0 0 0 1 100
execute at @n[tag=next_to_diamond] run particle minecraft:end_rod ~ ~ ~ 0.5 0 0.5 0.01 100
execute at @n[tag=next_to_diamond] run particle minecraft:enchant ~ ~0.2 ~ 0.25 0 0.25 2 24

# Remove tags
tag @e[type=marker,tag=tile] remove next_to_diamond