# Create an entry for the player menu
# Executed as player being added

# Summon item to hold player data
summon item ~ ~ ~ {Tags:["player_data"],Item:{id:"stone"}}
loot replace entity @n[tag=player_data] container.0 loot {pools:[{rolls:1,entries:[{type:"minecraft:item",name:"minecraft:player_head",modifier:{type:"minecraft:fill_player_head",entity:"this"}}]}]}

# Fill in entry
function mineparty:settings/host/player/menu/fill_entry with entity @n[tag=player_data] Item.components."minecraft:profile"

# Clean up
kill @n[tag=player_data]