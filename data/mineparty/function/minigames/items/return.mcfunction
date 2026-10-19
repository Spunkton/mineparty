# Executed per player, at player
# Return the inventory

# Summon chest minecarts
summon chest_minecart ~ ~ ~ {Invulnerable:1b,Tags:["return_inventory0","return_inventory"]}
summon chest_minecart ~ ~ ~ {Invulnerable:1b,Tags:["return_inventory1","return_inventory"]}

# Get inventory info from storage and put in chests
function mineparty:minigames/items/return_with_uuid with entity @s

# Get items from chests and put into inventory
# Hotbar and first two rows of inventory (I'm so sorry if there is a better way to do this) (Update: There is a better way to do this now! But this works so I'm keeping it like this)
item replace entity @s container.0 from entity @n[tag=return_inventory0] container.0
item replace entity @s container.1 from entity @n[tag=return_inventory0] container.1
item replace entity @s container.2 from entity @n[tag=return_inventory0] container.2
item replace entity @s container.3 from entity @n[tag=return_inventory0] container.3
item replace entity @s container.4 from entity @n[tag=return_inventory0] container.4
item replace entity @s container.5 from entity @n[tag=return_inventory0] container.5
item replace entity @s container.6 from entity @n[tag=return_inventory0] container.6
item replace entity @s container.7 from entity @n[tag=return_inventory0] container.7
item replace entity @s container.8 from entity @n[tag=return_inventory0] container.8
item replace entity @s container.9 from entity @n[tag=return_inventory0] container.9
item replace entity @s container.10 from entity @n[tag=return_inventory0] container.10
item replace entity @s container.11 from entity @n[tag=return_inventory0] container.11
item replace entity @s container.12 from entity @n[tag=return_inventory0] container.12
item replace entity @s container.13 from entity @n[tag=return_inventory0] container.13
item replace entity @s container.14 from entity @n[tag=return_inventory0] container.14
item replace entity @s container.15 from entity @n[tag=return_inventory0] container.15
item replace entity @s container.16 from entity @n[tag=return_inventory0] container.16
item replace entity @s container.17 from entity @n[tag=return_inventory0] container.17
item replace entity @s container.18 from entity @n[tag=return_inventory0] container.18
item replace entity @s container.19 from entity @n[tag=return_inventory0] container.19
item replace entity @s container.20 from entity @n[tag=return_inventory0] container.20
item replace entity @s container.21 from entity @n[tag=return_inventory0] container.21
item replace entity @s container.22 from entity @n[tag=return_inventory0] container.22
item replace entity @s container.23 from entity @n[tag=return_inventory0] container.23
item replace entity @s container.24 from entity @n[tag=return_inventory0] container.24
item replace entity @s container.25 from entity @n[tag=return_inventory0] container.25
item replace entity @s container.26 from entity @n[tag=return_inventory0] container.26

# Rest of inventory
item replace entity @s inventory.18 from entity @n[tag=return_inventory1] container.0
item replace entity @s inventory.19 from entity @n[tag=return_inventory1] container.1
item replace entity @s inventory.20 from entity @n[tag=return_inventory1] container.2
item replace entity @s inventory.21 from entity @n[tag=return_inventory1] container.3
item replace entity @s inventory.22 from entity @n[tag=return_inventory1] container.4
item replace entity @s inventory.23 from entity @n[tag=return_inventory1] container.5
item replace entity @s inventory.24 from entity @n[tag=return_inventory1] container.6
item replace entity @s inventory.25 from entity @n[tag=return_inventory1] container.7
item replace entity @s inventory.26 from entity @n[tag=return_inventory1] container.8

item replace entity @s weapon.offhand from entity @n[tag=return_inventory1] container.9
item replace entity @s armor.head from entity @n[tag=return_inventory1] container.10
item replace entity @s armor.chest from entity @n[tag=return_inventory1] container.11
item replace entity @s armor.legs from entity @n[tag=return_inventory1] container.12
item replace entity @s armor.feet from entity @n[tag=return_inventory1] container.13
item replace entity @s player.crafting.0 from entity @n[tag=return_inventory1] container.14
item replace entity @s player.crafting.1 from entity @n[tag=return_inventory1] container.15
item replace entity @s player.crafting.2 from entity @n[tag=return_inventory1] container.16
item replace entity @s player.crafting.3 from entity @n[tag=return_inventory1] container.17
item replace entity @s player.cursor from entity @n[tag=return_inventory1] container.18

# Store minecart data to storage
kill @e[tag=return_inventory]
kill @e[type=item,distance=..2,nbt={Age:0s}]