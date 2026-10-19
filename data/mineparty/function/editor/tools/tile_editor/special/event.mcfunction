# Needs $(UUID)

# Summon data carrying marker
$summon marker ~ ~ ~ {Tags:["dialog_data"],data:{dialog:{type:"minecraft:confirmation",title:"Special settings for \"event\"",inputs:[{type:"minecraft:text",key:"description",label:{text:"Tile Description",hover_event:{action:"show_text",value:"Description that is shown when inspected with a Tile Inspector.\n\nAvoid double quote marks (\")."}},initial:"",label_visible:1b,max_length:64},{type:"minecraft:text",key:"command",label:{text:"Command",hover_event:{action:"show_text",value:"Command that is run when a player lands on this tile.\n\nThe game does not automatically continue after landing on this tile! Run/schedule \"function mineparty:command_queue\" for that.\n\nAvoid double quote marks (\")."}},initial:"",max_length:32000}],yes:{label:"Confirm changes",action:{type:"minecraft:dynamic/run_command",template:"function mineparty:editor/tiles/edit_special {UUID:$(UUID),location:\"data.special.event\",value:{description:\"\u0024(description)\",command:\"\u0024(command)\"}}"}},no:{label:"Cancel"}}}}

# Set initial from special data from tile
$execute as @n[type=marker,tag=tile,nbt={UUID:$(UUID)}] if data entity @s data.special.event.description run data modify entity @n[tag=dialog_data] data.dialog.inputs[0].initial set from entity @s data.special.event.description
$execute as @n[type=marker,tag=tile,nbt={UUID:$(UUID)}] if data entity @s data.special.event.command run data modify entity @n[tag=dialog_data] data.dialog.inputs[1].initial set from entity @s data.special.event.command

# Show dialog 
function mineparty:dialog with entity @n[tag=dialog_data] data

# Clean up 
kill @e[type=marker,tag=dialog_data]