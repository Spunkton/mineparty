# Clear rulebook
clear @a *[custom_data~{rulebook:true}]

# Set gamemodes
gamemode adventure @a[tag=!not_playing]

# Join teams
team join no_collision @a

# Summon the big mannequin
### Kill old one
kill @e[tag=pigment_perfect_reference]
### Summon naked
execute at @e[tag=pigment_perfect_reference_spawn] run summon armor_stand ~ ~ ~ {NoGravity:1b,Invulnerable:1b,ShowArms:1b,NoBasePlate:1b,Tags:["pigment_perfect_reference","pigment_perfect_mannequin"],attributes:[{id:"minecraft:scale",base:3}],DisabledSlots:4144959}

# Summon smaller mannequins
kill @e[tag=pigment_perfect_mannequin,tag=!pigment_perfect_reference,tag=!persistent]
execute at @e[tag=pigment_perfect_mannequin_spawn] run summon armor_stand ~ ~ ~ {NoGravity:1b,Invulnerable:1b,ShowArms:1b,NoBasePlate:1b,Tags:["pigment_perfect_mannequin"],attributes:[{id:"minecraft:scale",base:1}],DisabledSlots:4144959}
execute as @e[tag=pigment_perfect_mannequin,tag=!pigment_perfect_reference,tag=!persistent] at @s facing entity @n[tag=pigment_perfect_reference] feet run tp @s ~ ~ ~ ~ ~

# Place crafting tables
execute at @e[tag=pigment_perfect_crafting_table] run setblock ~ ~ ~ minecraft:crafting_table

# Teleport to start and look at reference
execute at @n[tag=pigment_perfect_start] run tp @a ~ ~ ~
execute as @a at @s facing entity @n[tag=pigment_perfect_reference] feet run tp @s ~ ~ ~ ~ ~

# Give dyes (in inventory, not hotbar)
item fill entity @a[tag=!not_playing] hotbar.* with barrier
loot give @a[tag=!not_playing] loot {pools:[{rolls:64,entries:[{type:"minecraft:group",children:[{type:"minecraft:tag",items:"#minecraft:dyes"}]}]}]}
item fill entity @a[tag=!not_playing] hotbar.* with air

# Give armor
item replace entity @a[tag=!not_playing] armor.head with leather_helmet
item replace entity @a[tag=!not_playing] armor.chest with leather_chestplate
item replace entity @a[tag=!not_playing] armor.legs with leather_leggings
item replace entity @a[tag=!not_playing] armor.feet with leather_boots

# Start dressing up
execute as @e[tag=persistent,tag=pigment_perfect_mannequin] run data remove entity @s equipment
schedule function mineparty:minigames/minigames/pigment_perfect/clothing/feet 2s
schedule function mineparty:minigames/minigames/pigment_perfect/clothing/legs 3s
schedule function mineparty:minigames/minigames/pigment_perfect/clothing/chest 4s
schedule function mineparty:minigames/minigames/pigment_perfect/clothing/head 5s
# Notif
title @a subtitle "Dressing up..."
title @a title ""

# Schedule tick
schedule function mineparty:minigames/minigames/pigment_perfect/start/after_intro 5s