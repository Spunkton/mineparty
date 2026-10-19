# Needs $(map)

# Cool explosion
execute as @n[tag=diamond] at @s run particle minecraft:end_rod ~ ~ ~ 0 0 0 0.3 100
execute as @n[tag=diamond] at @s run playsound minecraft:block.amethyst_cluster.break block @a ~ ~ ~ 1 1 1
execute as @n[tag=diamond] at @s run playsound minecraft:entity.puffer_fish.blow_out block @a ~ ~ ~ 1 0 1


# Kill diamond indicators
kill @e[tag=diamond_indicator]

# Blacklist the 10 closest tiles
tag @n[tag=diamond] add blacklist
tag @n[tag=diamond] add double_blacklist
$execute unless entity @n[tag=diamond] run tag @e[tag=start,nbt={data:{map:"$(map)"}}] add blacklist

# Blacklist neighbours x10
execute as @e[tag=blacklist,tag=!blacklist_old] at @s run function mineparty:game/tiles/diamond/blacklist
execute as @e[tag=blacklist,tag=!blacklist_old] at @s run function mineparty:game/tiles/diamond/blacklist
execute as @e[tag=blacklist,tag=!blacklist_old] at @s run function mineparty:game/tiles/diamond/blacklist
execute as @e[tag=blacklist,tag=!blacklist_old] at @s run function mineparty:game/tiles/diamond/blacklist
execute as @e[tag=blacklist,tag=!blacklist_old] at @s run function mineparty:game/tiles/diamond/blacklist
execute as @e[tag=blacklist,tag=!blacklist_old] at @s run function mineparty:game/tiles/diamond/blacklist
execute as @e[tag=blacklist,tag=!blacklist_old] at @s run function mineparty:game/tiles/diamond/blacklist
execute as @e[tag=blacklist,tag=!blacklist_old] at @s run function mineparty:game/tiles/diamond/blacklist
execute as @e[tag=blacklist,tag=!blacklist_old] at @s run function mineparty:game/tiles/diamond/blacklist
execute as @e[tag=blacklist,tag=!blacklist_old] at @s run function mineparty:game/tiles/diamond/blacklist

# Blacklist occupied tiles
execute as @e[tag=tile] if data entity @s data.occupied[] run tag @s add blacklist
execute as @e[tag=tile] if data entity @s data.occupied[] run tag @s add double_blacklist

# Tag with diamond
tag @e remove diamond
$tag @n[sort=random,tag=tile,nbt={data:{map:"$(map)"}},tag=!blacklist,tag=!no_diamond] add diamond
### Ignore blacklist if there are no options otherwise
$execute unless entity @n[tag=diamond,nbt={data:{map:"$(map)"}}] run tag @n[sort=random,tag=tile,nbt={data:{map:"$(map)"}},tag=!no_diamond,tag=!double_blacklist] add diamond

# Temp indicator so the diamond indicator doesn't immediately spawn
execute at @n[tag=diamond] run summon marker ~ ~ ~ {Tags:["diamond_indicator","placeholder"]}

# Make everyone look at the new diamond tile
execute as @a at @s facing entity @n[tag=diamond] feet run tp @s ~ ~ ~ ~ ~-10

# Remove blacklist tag
$tag @e[tag=tile,nbt={data:{map:"$(map)"}}] remove blacklist
$tag @e[tag=tile,nbt={data:{map:"$(map)"}}] remove blacklist_old
$tag @e[tag=tile,nbt={data:{map:"$(map)"}}] remove double_blacklist