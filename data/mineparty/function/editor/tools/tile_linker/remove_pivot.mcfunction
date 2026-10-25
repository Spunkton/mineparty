#Adds pivot to linker data
#First summons an armor stand to transfer item to, then modifies it and puts it back
summon armor_stand ~ ~ ~ {Tags:["temp"],Invisible:1b}
item replace entity @n[tag=temp] armor.head from entity @s weapon.mainhand
data remove entity @n[tag=temp] equipment.head.components."minecraft:custom_data".pivot
data remove entity @n[tag=temp] equipment.head.components."minecraft:enchantment_glint_override"
data modify entity @n[tag=temp] equipment.head.components."minecraft:lore" set value [{"color":"gray","italic":false,"text":"Edits from which tile you can move to which"},[{"color":"gray","italic":false,"text":"Use "},{"color":"blue","keybind":"key.use"}," to ",{"underlined":true,"text":"edit"}," links moving ",{"underlined":true,"text":"from"}," this tile"]]
item replace entity @s weapon.mainhand from entity @n[tag=temp] armor.head
kill @e[tag=temp,type=armor_stand]

#Notify
title @s actionbar "Removed linking point"