# Second impact frame
execute as @p[tag=!no_flashing_imagery,tag=puncher] at @s anchored eyes run summon text_display ^ ^ ^0.3 {billboard:"center",see_through:1b,Tags:["impact_frame","impact_frame_1"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,-5f,0f],scale:[20f,50f,20f]},text:{"color":"black","text":"       "},background:-1}
#kill @e[tag=impact_frame_0]
data modify entity @n[tag=helper] glow_color_override set value 0
data modify entity @n[tag=helper] Glowing set value true

# Schedule dialog
schedule function mineparty:game/helper/dialog/interaction/attack 2t