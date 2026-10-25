# Adds pivot to linker data
# First summons an armor stand to transfer item to, then modifies it and puts it back
summon armor_stand ~ ~ ~ {Tags:["temp"],Invisible:1b}
item replace entity @n[tag=temp] armor.head from entity @s weapon.mainhand
data modify entity @n[tag=temp] equipment.head.components."minecraft:custom_data".pivot set from entity @n[tag=selected] UUID
data modify entity @n[tag=temp] equipment.head.components."minecraft:enchantment_glint_override" set value true
data modify entity @n[tag=temp] equipment.head.components."minecraft:lore" set value [{"color":"gray","italic":false,"text":"Connects from the selected pivot towards a tile"},[{"color":"gray","italic":false,"text":"Use "},{"color":"blue","keybind":"key.use"}," on the pivot to ",{"underlined":true,"text":"finish"}," linking"],[{"color":"gray","italic":false,"text":"Use "},{"color":"blue","keybind":"key.use"}," on a tile to ",{"underlined":true,"text":"connect"}," it to the pivot"],[{"color":"gray","italic":false,"text":"Use "},{"color":"blue","keybind":"key.sneak"}," + ",{"color":"blue","keybind":"key.use"}," to ",{"underlined":true,"text":"edit"}," link data"]]
item replace entity @s weapon.mainhand from entity @n[tag=temp] armor.head
kill @e[tag=temp,type=armor_stand]

# Notify
execute if data entity @n[tag=selected] data.links[] run title @s actionbar "Added pivot"
execute unless data entity @n[tag=selected] data.links[] run title @s actionbar "Added pivot! Link another tile to fix the dead end"

# Sucks that I have to add this
tag @s add pleasedontremovemypivotimmediately