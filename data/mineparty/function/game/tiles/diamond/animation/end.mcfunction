# Clear schedule
# no?

# Clear impact frame
kill @e[tag=impact_frame]
execute as @e[tag=diamond_indicator] run data modify entity @s Glowing set value false

# Teleport the orbiting diamonds with a little more speed
execute as @e[tag=orbit,tag=clockwise,tag=diamond_indicator] at @s run tp @s ~ ~ ~ ~10 ~
execute as @e[tag=orbit,tag=counter,tag=diamond_indicator] at @s run tp @s ~ ~ ~ ~-10 ~

# Scale back up
data modify entity @n[tag=main_diamond] transformation set value {left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-1.5f,10f,-1.5f],scale:[3f,3f,3f]}

# Cool effects
execute as @n[tag=diamond] at @s run particle minecraft:end_rod ~ ~11.5 ~ 1 1 1 0.8 1000
execute as @n[tag=diamond] at @s run particle minecraft:trial_spawner_detection_ominous ~ ~11.5 ~ 0.05 4 0.05 0 1000 force
execute as @n[tag=diamond] at @s run particle dust_color_transition{from_color:[1.000,1.000,1.000],to_color:[0.000,1.000,1.000],scale:1} ~ ~ ~ 1 0 1 0 500
execute as @n[tag=diamond] at @s run playsound minecraft:block.end_portal.spawn block @a ~ ~ ~ 0.2 1 0.2

# Notify
tellraw @a [{"shadow_color":-16749717,"text":""},{"color":"#C2FFFB","text":""},{"color":"#BEFEFB","text":"A "},{"color":"#BAFCFB","text":"n"},{"color":"#B6FBFC","text":"e"},{"color":"#B3FAFC","text":"w "},{"color":"#AFF8FC","text":"d"},{"color":"#ABF7FC","text":"i"},{"color":"#A7F6FC","text":"a"},{"color":"#A3F5FC","text":"m"},{"color":"#9FF3FD","text":"o"},{"color":"#9BF2FD","text":"n"},{"color":"#97F1FD","text":"d "},{"color":"#94EFFD","text":"h"},{"color":"#90EEFD","text":"a"},{"color":"#8CEDFD","text":"s "},{"color":"#88EBFE","text":"s"},{"color":"#84EAFE","text":"p"},{"color":"#80E9FE","text":"a"},{"color":"#7CE8FE","text":"w"},{"color":"#78E6FE","text":"n"},{"color":"#75E5FE","text":"e"},{"color":"#71E4FF","text":"d"},{"color":"#69E1FF","text":"!"}]

# Remove tags
tag @e[tag=diamond_indicator] remove transit

# Kill placeholder
kill @e[tag=placeholder,tag=diamond_indicator]