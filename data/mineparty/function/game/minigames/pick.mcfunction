# Picks a minigame from the pool
# Needs array $(tags)

# Refill if pool is empty
$execute unless data storage mineparty:main minigames.pool[{tags:$(tags)}] unless data storage mineparty:main minigames.pool[{tags:['$(tags)']}] run tellraw @a[tag=host,tag=debug] "\u00a7eDEBUG > Refilling pool..."
$execute unless data storage mineparty:main minigames.pool[{tags:$(tags)}] unless data storage mineparty:main minigames.pool[{tags:['$(tags)']}] run function mineparty:game/minigames/refill_pool {tags:$(tags)}

# Copies filtered list
data modify storage mineparty:main minigames.filtered set value []
$data modify storage mineparty:main minigames.filtered append from storage mineparty:main minigames.pool[{tags:$(tags)}]
$data modify storage mineparty:main minigames.filtered append from storage mineparty:main minigames.pool[{tags:['$(tags)']}]

# Picks random from that list
function mineparty:other/pick_from_list {input:"storage mineparty:main minigames.filtered",output:"storage mineparty:main minigames.pick"}

# Removes from pool
function mineparty:game/minigames/pick/remove_from_pool with storage mineparty:main minigames.pick

# DEBUG
tellraw @a[tag=host,tag=debug] ["\u00a7eDEBUG > Picked ",{"nbt":"minigames.pick.id","storage":"mineparty:main"}]