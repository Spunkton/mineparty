# Executed as player being shown the dialog
# Needs $(UUID)

# Summon item to hold player data $(name) and $(id)
summon item ~ ~ ~ {Tags:["player_data"],Item:{id:"stone"}}
$execute as @p[nbt={UUID:$(UUID)}] run loot replace entity @n[tag=player_data] container.0 loot {pools:[{rolls:1,entries:[{type:"minecraft:item",name:"minecraft:player_head",modifier:{type:"minecraft:fill_player_head",entity:"this"}}]}]}

# Create data
function mineparty:settings/host/player/dialog/create with entity @n[tag=player_data] Item.components."minecraft:profile"

# Show dialog
function mineparty:dialog with storage mineparty:main function.output

# Clean up
kill @n[tag=player_data]
