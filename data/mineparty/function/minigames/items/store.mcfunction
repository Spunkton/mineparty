# Executed per player, at player
# Stores inventory to storage mineparty:storage

# Summon chest minecarts
summon chest_minecart ~ ~ ~ {Invulnerable:1b,Tags:["store_inventory0","store_inventory"]}
summon chest_minecart ~ ~ ~ {Invulnerable:1b,Tags:["store_inventory1","store_inventory"]}

# Store items to minecarts

# Hotbar and first two rows of inventory
data modify entity @n[tag=store_inventory0] Items set from entity @s Inventory

# Rest of inventory *sigh*
# Update: This can be done with slot sources now! I'm too lazy to update this tho
item replace entity @n[tag=store_inventory1] container.0 from entity @s inventory.18
item replace entity @n[tag=store_inventory1] container.1 from entity @s inventory.19
item replace entity @n[tag=store_inventory1] container.2 from entity @s inventory.20
item replace entity @n[tag=store_inventory1] container.3 from entity @s inventory.21
item replace entity @n[tag=store_inventory1] container.4 from entity @s inventory.22
item replace entity @n[tag=store_inventory1] container.5 from entity @s inventory.23
item replace entity @n[tag=store_inventory1] container.6 from entity @s inventory.24
item replace entity @n[tag=store_inventory1] container.7 from entity @s inventory.25
item replace entity @n[tag=store_inventory1] container.8 from entity @s inventory.26

item replace entity @n[tag=store_inventory1] container.9 from entity @s weapon.offhand
item replace entity @n[tag=store_inventory1] container.10 from entity @s armor.head
item replace entity @n[tag=store_inventory1] container.11 from entity @s armor.chest
item replace entity @n[tag=store_inventory1] container.12 from entity @s armor.legs
item replace entity @n[tag=store_inventory1] container.13 from entity @s armor.feet
item replace entity @n[tag=store_inventory1] container.14 from entity @s player.crafting.0
item replace entity @n[tag=store_inventory1] container.15 from entity @s player.crafting.1
item replace entity @n[tag=store_inventory1] container.16 from entity @s player.crafting.2
item replace entity @n[tag=store_inventory1] container.17 from entity @s player.crafting.3
item replace entity @n[tag=store_inventory1] container.18 from entity @s player.cursor

# Store it to storage
data modify storage mineparty:inventories inventory append value {UUID:[I;1,1,1,1],inventory0:[],inventory1:[]}
data modify storage mineparty:inventories inventory[{UUID:[I;1,1,1,1]}].inventory0 set from entity @n[tag=store_inventory0] Items
data modify storage mineparty:inventories inventory[{UUID:[I;1,1,1,1]}].inventory1 set from entity @n[tag=store_inventory1] Items
data modify storage mineparty:inventories inventory[{UUID:[I;1,1,1,1]}].UUID set from entity @s UUID

# Clear inventory
clear @s

# Store minecart data to storage
kill @e[tag=store_inventory]
kill @e[type=item,distance=..2,nbt={Age:0s}]