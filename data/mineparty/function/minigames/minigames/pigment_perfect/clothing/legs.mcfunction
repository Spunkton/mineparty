# Gives the mannequins cool pants

# Summon item to put on their heads
summon item ~ ~ ~ {Tags:["pigment_perfect_clothing"],Item:{id:"minecraft:leather_leggings",count:1,components:{"minecraft:dyed_color":0}}}

# Set color
execute store result entity @n[tag=pigment_perfect_clothing] Item.components."minecraft:dyed_color" int 1 run random value 0..16777215

# Add to all mannequins (sorry for the ambiguous terminology, but they're armor stands, although it should theoretically also work for mannequins with the same tag)
execute as @e[tag=pigment_perfect_mannequin] run data modify entity @s equipment.legs set from entity @n[tag=pigment_perfect_clothing] Item

# Effects
execute at @e[tag=pigment_perfect_reference] run particle minecraft:end_rod ~ ~2.5 ~ 1 0 1 0.02 64
execute at @e[tag=pigment_perfect_reference] run playsound minecraft:item.armor.equip_leather neutral @a ~ ~ ~
execute as @a at @s run playsound minecraft:block.note_block.pling record @s ~ ~ ~ 1 0.89

# Remove item
kill @n[tag=pigment_perfect_clothing]