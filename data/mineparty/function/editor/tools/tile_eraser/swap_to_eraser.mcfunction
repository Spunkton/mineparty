# Swaps to Tile Eraser (from presumably the spawner tile)

# Sound effect
playsound minecraft:block.fire.extinguish player @s ~ ~ ~ 0.4 2

# Summon Tile Spawner item
function mineparty:editor/tools/tile_eraser/give

# Replace current item 
item replace entity @s weapon.mainhand from entity @n[tag=give_item] container.0

# Kill item
kill @n[tag=give_item]

# Debug notif
tellraw @s[tag=debug] {"color":"gray","text":"Replaced item with Tile Eraser cleared."}
