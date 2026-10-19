# Pause the helper
data modify entity @n[tag=helper] NoAI set value true
data modify entity @n[tag=helper] Motion set value [0d,0d,0d]

# Sound effect
execute at @n[tag=helper] run playsound minecraft:item.mace.smash_ground neutral @a ~ ~ ~ 0.5
execute at @n[tag=helper] run playsound minecraft:entity.puffer_fish.blow_up neutral @s ~ ~ ~ 1 1 1
execute at @n[tag=helper] run playsound minecraft:entity.puffer_fish.blow_up neutral @s ~ ~ ~ 1 1 1

# First impact frame
execute as @a[tag=!no_flashing_imagery,tag=puncher] at @s anchored eyes run summon text_display ^ ^ ^0.7 {billboard:"center",see_through:1b,Tags:["impact_frame","impact_frame_0"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,-5f,0f],scale:[20f,50f,20f]},text:{"color":"black","text":"       "},background:-16777216}
data modify entity @n[tag=helper] Glowing set value true

# Schedule next frame
schedule function mineparty:game/helper/dialog/interaction/attack_impact_1 2t