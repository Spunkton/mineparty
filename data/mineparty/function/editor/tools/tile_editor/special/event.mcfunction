# Needs $(UUID)

# Summon data carrying marker
$summon marker ~ ~ ~ {Tags:["dialog_data"],data:{dialog:{type:"minecraft:confirmation",title:"Special settings","body":[{"type":"minecraft:item","item":{"id":"minecraft:test_block"}},{"type":"minecraft:plain_message","contents":["",{"color":"gold","text":"======= Edit Special Data ======="},{"color":"aqua","text":"\n\nTile type: "},"Event"]}],inputs:[{type:"minecraft:text",key:"command",label:{text:"Command",hover_event:{action:"show_text",value:"Command that is run when a player lands on this tile.\n\nThe game does not automatically continue after landing on this tile! Run/schedule \"function mineparty:command_queue\" for that.\n\nAvoid double quote marks (\")."}},initial:"",max_length:32767}],yes:{label:"Confirm changes",action:{type:"minecraft:dynamic/run_command",template:"function mineparty:editor/tiles/edit_special {UUID:$(UUID),location:\"data.special\",value:{command:\"\u0024(command)\"}}"}},no:{label:"Cancel"}}}}

# Set initial from special data from tile
$data modify entity @n[tag=dialog_data] data.dialog.inputs[0].initial set from entity @n[type=marker,tag=tile,nbt={UUID:$(UUID)}] data.special.command

# Show dialog 
function mineparty:dialog with entity @n[tag=dialog_data] data

# Clean up 
kill @e[type=marker,tag=dialog_data]