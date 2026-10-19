# Needs $(UUID)

# Cancel if inventory not found
$execute unless data storage mineparty:inventories inventory[{UUID:$(UUID)}] run kill @e[tag=return_inventory]
$execute unless data storage mineparty:inventories inventory[{UUID:$(UUID)}] run return 0

# Fill chests with old inventory
$data modify entity @n[tag=return_inventory0] Items set from storage mineparty:inventories inventory[{UUID:$(UUID)}].inventory0
$data modify entity @n[tag=return_inventory1] Items set from storage mineparty:inventories inventory[{UUID:$(UUID)}].inventory1
$data remove storage mineparty:inventories inventory[{UUID:$(UUID)}]

return 1