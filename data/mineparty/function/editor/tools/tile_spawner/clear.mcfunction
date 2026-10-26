# Clears copied data from Tile Spawner

# Turn into Eraser if tile was already blank
execute if items entity @s weapon.mainhand *[minecraft:custom_data~{blank_tile:true}] run return run function mineparty:editor/tools/tile_eraser/swap_to_eraser

# Sound effect
playsound minecraft:ui.toast.out player @s ~ ~ ~ 1 2
playsound minecraft:ui.toast.out player @s ~ ~ ~ 1 2
playsound minecraft:ui.toast.out player @s ~ ~ ~ 1 2

# Summon Tile Spawner item
function mineparty:editor/tools/tile_spawner/give

# Replace current item 
item replace entity @s weapon.mainhand from entity @n[tag=give_item] container.0

# Kill item
kill @n[tag=give_item]

# Debug notif
tellraw @s[tag=debug] {"color":"yellow","text":"Tile Spawner cleared."}
