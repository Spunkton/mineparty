# Needs $(name) and $(id)
# Creates a dialog json and sends it to storage mineparty:main function.output.dialog

# Clear output
data remove storage mineparty:main function.output

# Tag player with UUID $(id) for easier reference
$tag @p[nbt={UUID:$(id)}] add reference

# Set base data
$data modify storage mineparty:main dialog set value {type:"minecraft:multi_action",title:"Player settings",body:[{type:"minecraft:item",item:{id:"minecraft:player_head",components:{"minecraft:profile":{name:$(name)}}}},{type:"minecraft:plain_message",contents:["",{"color":"gold","text":"======= $(name) ======="},"\n\nStatus: ",{"color":"white","text":"Idle\n(Game has not started yet)"}]}],columns:1,actions:[{label:"Teleport to player",action:{type:"minecraft:run_command",command:"tp @s @p[nbt={UUID:$(id)}]"}},{label:"Obtain head",action:{type:"minecraft:run_command",command:"give @s player_head[profile={\"id\":$(id)}]"}},{label:"Reset base attributes",action:{type:"minecraft:run_command",command:"execute as @p[nbt={UUID:$(id)}] run function mineparty:game/player/reset_attributes"}},{label:"Kill player",action:{type:"minecraft:run_command",command:"kill @p[nbt={UUID:$(id)}]"}},{label:"Cancel"}]}

# Promote/Demote host (Button)
$execute if entity @p[tag=reference,tag=!host] run data modify storage mineparty:main dialog.actions insert -2 value {label:{text:"Promote to Host",color:"light_purple"},action:{type:"minecraft:run_command",command:"tag @p[nbt={UUID:$(id)}] add host"}}
$execute if entity @p[tag=reference,tag=host] run data modify storage mineparty:main dialog.actions insert -2 value {label:{text:"Demote from Host",color:"light_purple"},action:{type:"minecraft:run_command",command:"tag @p[nbt={UUID:$(id)}] remove host"}}

# Save resources if game hasn't started yet
execute unless data storage mineparty:main playing_game run data modify storage mineparty:main function.output.dialog set from storage mineparty:main dialog
execute unless data storage mineparty:main playing_game run tag @a remove reference
execute unless data storage mineparty:main playing_game run return 0

# Set status
### If Player
execute if entity @p[tag=reference,tag=player] run data modify storage mineparty:main dialog.body[1].contents[3].color set value "green"
execute if entity @p[tag=reference,tag=player] run data modify storage mineparty:main dialog.body[1].contents[3].text set value "Player"
### If Sideliner
execute if entity @p[tag=reference,tag=!player,tag=!not_playing] run data modify storage mineparty:main dialog.body[1].contents[3].color set value "yellow"
execute if entity @p[tag=reference,tag=!player,tag=!not_playing] run data modify storage mineparty:main dialog.body[1].contents[3].text set value "Sideliner"
### If Spectator
execute if entity @p[tag=reference,tag=not_playing] run data modify storage mineparty:main dialog.body[1].contents[3].color set value "red"
execute if entity @p[tag=reference,tag=not_playing] run data modify storage mineparty:main dialog.body[1].contents[3].text set value "Spectator"


#======# Buttons #======#

# Enable chat button trigger
$execute if entity @p[tag=reference,tag=!not_playing] run data modify storage mineparty:main dialog.actions insert 1 value {label:"Enable chat button trigger",action:{type:"minecraft:run_command",command:"scoreboard players enable @p[nbt={UUID:$(id)}] mineparty_custom_trigger"}}

# Teleport to tile
$execute if entity @p[tag=reference,tag=player] run data modify storage mineparty:main dialog.actions insert 1 value {label:"Teleport them to tile",action:{type:"minecraft:run_command",command:"execute as @p[nbt={UUID:$(id)}] run function mineparty:game/tiles/tp_to_occupied with entity @s"}}

# Join game
$execute if entity @p[tag=reference,tag=!player] run data modify storage mineparty:main dialog.actions insert -2 value {label:{text:"Join game",color:"green"},tooltip:"Makes them fully join the game!",action:{type:"minecraft:run_command",command:"execute as @p[nbt={UUID:$(id)}] run function mineparty:game/player/join with storage mineparty:main playing_game"}}

# Sideline
$execute as @p[tag=reference] unless entity @s[tag=!player,tag=!not_playing] run data modify storage mineparty:main dialog.actions insert -2 value {label:{text:"Make Sideliner",color:"yellow"},tooltip:"Makes them able to play minigames, but removes them from the board.",action:{type:"minecraft:run_command",command:"execute as @p[nbt={UUID:$(id)}] run function mineparty:game/player/sideline with storage mineparty:main playing_game"}}

# Remove from game
$execute if entity @p[tag=reference,tag=!not_playing] run data modify storage mineparty:main dialog.actions insert -2 value {label:{text:"Remove from game",color:"red"},tooltip:"Removes the player from the board and from minigames!",action:{type:"minecraft:run_command",command:"function mineparty:game/player/remove {UUID:$(id)}"}}
$execute if entity @p[tag=reference,tag=not_playing] run data modify storage mineparty:main dialog.actions insert -2 value {label:{text:"Clear from game",color:"red"},tooltip:"Removes any part of the game this player may still be in.",action:{type:"minecraft:run_command",command:"function mineparty:game/player/remove {UUID:$(id)}"}}

#======# End of buttons #======#


# Send output to storage
data modify storage mineparty:main function.output.dialog set from storage mineparty:main dialog

# Clean up
tag @a remove reference