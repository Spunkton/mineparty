#Adds pivot to linker data
#First summons an armor stand to transfer item to, then modifies it and puts it back
summon armor_stand ~ ~ ~ {Tags:["temp"],Invisible:1b}
item replace entity @n[tag=temp] armor.head from entity @s weapon.mainhand
data remove entity @n[tag=temp] equipment.head.components."minecraft:custom_data".pivot
data remove entity @n[tag=temp] equipment.head.components."minecraft:enchantment_glint_override"
item replace entity @s weapon.mainhand from entity @n[tag=temp] armor.head
kill @e[tag=temp,type=armor_stand]

#Notify
title @s actionbar "Removed linking point"