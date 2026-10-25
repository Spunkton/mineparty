# Clears copied data from Tile editor

# Sound effect
playsound minecraft:ui.toast.out player @s ~ ~ ~ 1 2
playsound minecraft:ui.toast.out player @s ~ ~ ~ 1 2
playsound minecraft:ui.toast.out player @s ~ ~ ~ 1 2

# Summon Tile Editor item
function mineparty:editor/tools/tile_editor/give

# Replace current item 
item replace entity @s weapon.mainhand from entity @n[tag=give_item] container.0

# Kill item
kill @n[tag=give_item]

# Debug notif
tellraw @s[tag=debug] {"color":"gray","text":"Tile Editor cleared."}
