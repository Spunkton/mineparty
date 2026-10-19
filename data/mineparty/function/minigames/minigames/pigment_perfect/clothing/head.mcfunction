# Gives the mannequins a cool hat

# Summon item to put on their heads
summon item ~ ~ ~ {Tags:["pigment_perfect_clothing"],Item:{id:"minecraft:leather_helmet",count:1,components:{"minecraft:dyed_color":0}}}

# Set color
execute store result entity @n[tag=pigment_perfect_clothing] Item.components."minecraft:dyed_color" int 1 run random value 0..16777215

# Add to all mannequins (sorry for the ambiguous terminology, but they're armor stands, although it should theoretically also work for mannequins with the same tag)
execute as @e[tag=pigment_perfect_mannequin] run item replace entity @s armor.head from entity @n[tag=pigment_perfect_clothing] container.*

# Effects
execute at @e[tag=pigment_perfect_reference] run particle minecraft:end_rod ~ ~3 ~ 1 1 1 0.02 128
execute at @e[tag=pigment_perfect_reference] run particle minecraft:poof ~ ~3 ~ 1 2 1 0.2 256
execute at @e[tag=pigment_perfect_reference] run playsound minecraft:item.armor.equip_leather neutral @a ~ ~ ~
### Set fireworks with clothing colours
execute at @e[tag=pigment_perfect_reference] run summon firework_rocket ~ ~3 ~ {LifeTime:0,Tags:["pigment_perfect_fireworks"],FireworksItem:{id:"minecraft:firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:"large_ball",has_twinkle:true,colors:[I;16777215]}]}}}}
execute as @e[tag=pigment_perfect_fireworks] at @s run data modify entity @s FireworksItem.components."minecraft:fireworks".explosions[0].colors append from entity @n[type=minecraft:armor_stand] equipment.head.components."minecraft:dyed_color"
execute as @e[tag=pigment_perfect_fireworks] at @s run data modify entity @s FireworksItem.components."minecraft:fireworks".explosions[0].colors append from entity @n[type=minecraft:armor_stand] equipment.chest.components."minecraft:dyed_color"
execute as @e[tag=pigment_perfect_fireworks] at @s run data modify entity @s FireworksItem.components."minecraft:fireworks".explosions[0].colors append from entity @n[type=minecraft:armor_stand] equipment.legs.components."minecraft:dyed_color"
execute as @e[tag=pigment_perfect_fireworks] at @s run data modify entity @s FireworksItem.components."minecraft:fireworks".explosions[0].colors append from entity @n[type=minecraft:armor_stand] equipment.feet.components."minecraft:dyed_color"
### Chord!
execute as @a at @s run playsound minecraft:block.note_block.pling record @s ~ ~ ~ 1 0.5
execute as @a at @s run playsound minecraft:block.note_block.pling record @s ~ ~ ~ 1 1
execute as @a at @s run playsound minecraft:block.note_block.pling record @s ~ ~ ~ 1 1.26
execute as @a at @s run playsound minecraft:block.note_block.pling record @s ~ ~ ~ 1 1.5
execute as @a at @s run playsound minecraft:block.note_block.pling record @s ~ ~ ~ 1 1.78
execute as @a at @s run playsound minecraft:block.note_block.pling record @s ~ ~ ~ 1 2
### Pose!
execute store result score #random mineparty run random value 0..4
execute as @e[tag=pigment_perfect_mannequin,tag=!persistent] run function mineparty:minigames/minigames/pigment_perfect/start/pose

# Remove item
kill @n[tag=pigment_perfect_clothing]