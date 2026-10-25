# Needs $(UUID)

# Summon data carrying marker
$summon marker ~ ~ ~ {Tags:["dialog_data"],data:{dialog:{type:"minecraft:confirmation",title:"Special settings","body":[{"type":"minecraft:item","item":{"id":"minecraft:painting"}},{"type":"minecraft:plain_message","contents":["",{"color":"gold","text":"======= Edit Special Data ======="},{"color":"aqua","text":"\n\nTile type: "},"Custom"]}],inputs:[{type:"minecraft:text",key:"prompt",label:{text:"Prompt",hover_event:{action:"show_text",value:"Prompt that is shown to the host when a player lands on this tile.\n\nAvoid double quote marks (\")."}},initial:"",max_length:1024,multiline:{height:100}}],yes:{label:"Confirm changes",action:{type:"minecraft:dynamic/run_command",template:"function mineparty:editor/tiles/edit_special {UUID:$(UUID),location:\"data.special\",value:{prompt:\"\u0024(prompt)\"}}"}},no:{label:"Cancel"}}}}

# Set initial from special data from tile
$execute as @n[type=marker,tag=tile,nbt={UUID:$(UUID)}] if data entity @s data.special.prompt run data modify entity @n[tag=dialog_data] data.dialog.inputs[0].initial set from entity @s data.special.prompt

# Show dialog 
function mineparty:dialog with entity @n[tag=dialog_data] data

# Clean up 
kill @e[type=marker,tag=dialog_data]