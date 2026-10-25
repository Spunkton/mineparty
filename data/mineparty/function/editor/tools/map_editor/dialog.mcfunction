# Sets up and shows map editor dialog to @s

# Set up base dialog
$data modify storage mineparty:main dialog set value {"type": "minecraft:confirmation","title": "Map Data Editor","body": [{"type":"minecraft:item","item":{"id":"minecraft:filled_map"}},{"type":"minecraft:plain_message","contents":["",{"color":"gold","text":"======= Save Map ======="},{"color":"aqua","text":"\n\nMap id: "},"$(id)"]}],"inputs": [{"type": "minecraft:text","key": "name","label": "Display name:","initial": "$(name)"},{"type": "minecraft:number_range","key": "diamond_price","label": "Diamond Price","start": 0,"end": 64,"step": 1,"initial": $(diamond_price)},{"type": "minecraft:number_range","key": "minigame_prize","label": "Minigame prize money","start": 0,"end": 64,"step": 1,"initial": $(minigame_prize)}],"columns": 2,"yes":{"label": "Save map","action": {"type": "minecraft:dynamic/run_command","template": "function mineparty:editor/map/edit_map {id:\"$(id)\",name:\"\u0024(name)\",diamond_price:\u0024(diamond_price),minigame_prize:\u0024(minigame_prize)}"}},"no":{"label": "Cancel"}}

# Warnings if things are missing
### Dead ends
scoreboard players set #dead_ends mineparty 0
$execute as @e[type=marker,tag=tile,nbt={data:{map:"$(id)"}}] unless data entity @s data.links[] run scoreboard players add #dead_ends mineparty 1
execute unless score #dead_ends mineparty matches 0 run data modify storage mineparty:main dialog.body append value {"type":"minecraft:plain_message","contents":[{"color":"red","text":"Warning: Map contains "},"x"," dead end(s)!"]}
execute unless score #dead_ends mineparty matches 0 store result storage mineparty:main dialog.body[2].contents[1] int 1 run scoreboard players get #dead_ends mineparty
execute unless score #dead_ends mineparty matches 0 run data modify storage mineparty:main dialog.body[2].contents[1] set string storage mineparty:main dialog.body[2].contents[1]
### No starting tile
$execute unless entity @n[type=marker,tag=tile,tag=start,nbt={data:{map:"$(id)"}}] run data modify storage mineparty:main dialog.body append value {"type":"minecraft:plain_message","contents":{"color":"red","text":"Warning: Map has no starting tile!"}}

# Show dialog
function mineparty:dialog with storage mineparty:main