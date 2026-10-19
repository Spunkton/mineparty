# Shows clickable menu of all participants

# Summon dialog data holding marker
summon marker ~ ~ ~ {Tags:["dialog_data"],data:{dialog:{type:"minecraft:multi_action",body:[{"type":"minecraft:plain_message","contents":{"color":"gold","text":"======= Players ======="}}],title:"Select player",columns:1,actions:[{label:"Cancel"}]}}}

# Get entry from everyone
### Idle
execute unless data storage mineparty:main playing_game as @a run function mineparty:settings/host/player/menu/entry
### Players
execute if data storage mineparty:main playing_game as @a[tag=player] at @s run function mineparty:settings/host/player/menu/entry
### Sideliners
execute if data storage mineparty:main playing_game if entity @p[tag=!not_playing,tag=!player] run data modify entity @n[tag=dialog_data] data.dialog.body append value {"type":"minecraft:plain_message","contents":{"color":"gold","text":"======= Sideliners ======="}}
execute if data storage mineparty:main playing_game as @a[tag=!not_playing,tag=!player] at @s run function mineparty:settings/host/player/menu/entry
### Spectators
execute if data storage mineparty:main playing_game if entity @p[tag=not_playing] run data modify entity @n[tag=dialog_data] data.dialog.body append value {"type":"minecraft:plain_message","contents":{"color":"gold","text":"======= Spectators ======="}}
execute if data storage mineparty:main playing_game as @a[tag=not_playing] at @s run function mineparty:settings/host/player/menu/entry

# Show dialog
function mineparty:dialog with entity @n[tag=dialog_data] data

# Clean up
kill @n[tag=dialog_data]