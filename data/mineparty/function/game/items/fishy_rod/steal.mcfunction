# Takes item from hooked player
# Executed as player stealing

# Summon minecraft chest and store powers
summon chest_minecart ~ ~ ~ {Invulnerable:1b,Tags:["power_storage"]}
item override entity @n[tag=power_storage] container.* from entity @p[tag=fishy_hooked] mineparty:game/has_game_item

# Summon item
summon item ~ ~ ~ {Invulnerable:1b,Tags:["hooked_item"],Item:{id:"gold_ingot",count:1}}
data modify entity @n[tag=hooked_item] Owner set from entity @s UUID
function mineparty:other/pick_and_remove_from_list {input:"entity @n[tag=power_storage] Items",output:"entity @n[tag=hooked_item] Item"}

# Send items back to player
item override entity @p[tag=fishy_hooked] mineparty:game/has_game_item from entity @n[tag=power_storage] container.*

# Remove chest minecart
item fill entity @n[tag=power_storage] container.* with air
kill @n[tag=power_storage]

# Notif
data modify entity @n[tag=hooked_item] CustomName set from entity @n[tag=hooked_item] Item.components."minecraft:custom_name"
tellraw @a ["",{"selector":"@s"}," stole \u00a7a[",{"selector":"@n[tag=hooked_item]"},"\u00a7a]\u00a7r from ",{"selector":"@p[tag=fishy_hooked]"},"!"]