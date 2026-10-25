# Needs $(UUID)

# Summon data carrying marker
$summon marker ~ ~ ~ {Tags:["dialog_data"],data:{dialog:{"type":"minecraft:confirmation","title":"Special settings","body":[{"type":"minecraft:item","item":{"id":"minecraft:emerald"}},{"type":"minecraft:plain_message","contents":["",{"color":"gold","text":"======= Edit Special Data ======="},{"color":"aqua","text":"\n\nTile type: "},"Shop"]}],"inputs":[{"type":"minecraft:single_option","key":"direction","label":{"text":"Shop direction","hover_event":{"action":"show_text","value":"The shop will spawn in this direction"}},"options":[{"id":"east","initial":false},{"id":"south","initial":false},{"id":"west","initial":false},{"id":"north","initial":false}]}],"yes":{"label":"Confirm changes","action":{"type":"minecraft:dynamic/run_command","template":"function mineparty:editor/tiles/edit_special {UUID:$(UUID),location:\"data.special.direction\",value:\"\u0024(direction)\"}"}},"no":{"label":"Cancel"}}}}

# Set initial from special data from tile
$execute if data entity @n[type=marker,tag=tile,nbt={UUID:$(UUID)}] {data:{special:{direction:"east"}}} run data modify entity @n[tag=dialog_data] data.dialog.inputs[0].options[{"id":"east"}].initial set value true
$execute if data entity @n[type=marker,tag=tile,nbt={UUID:$(UUID)}] {data:{special:{direction:"south"}}} run data modify entity @n[tag=dialog_data] data.dialog.inputs[0].options[{"id":"south"}].initial set value true
$execute if data entity @n[type=marker,tag=tile,nbt={UUID:$(UUID)}] {data:{special:{direction:"west"}}} run data modify entity @n[tag=dialog_data] data.dialog.inputs[0].options[{"id":"west"}].initial set value true
$execute if data entity @n[type=marker,tag=tile,nbt={UUID:$(UUID)}] {data:{special:{direction:"north"}}} run data modify entity @n[tag=dialog_data] data.dialog.inputs[0].options[{"id":"north"}].initial set value true

# Show dialog 
function mineparty:dialog with entity @n[tag=dialog_data] data

# Clean up 
kill @e[type=marker,tag=dialog_data]