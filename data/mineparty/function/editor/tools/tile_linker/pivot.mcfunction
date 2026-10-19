# Adds pivot to linker data
# First summons an armor stand to transfer item to, then modifies it and puts it back
summon armor_stand ~ ~ ~ {Tags:["temp"],Invisible:1b}
item replace entity @n[tag=temp] armor.head from entity @s weapon.mainhand
data modify entity @n[tag=temp] equipment.head.components."minecraft:custom_data".pivot set from entity @n[tag=selected] UUID
data modify entity @n[tag=temp] equipment.head.components."minecraft:enchantment_glint_override" set value true
item replace entity @s weapon.mainhand from entity @n[tag=temp] armor.head
kill @e[tag=temp,type=armor_stand]

# Notify
title @s actionbar "Added linking point"

# Sucks that I have to add this
tag @s add pleasedontremovemypivotimmediately