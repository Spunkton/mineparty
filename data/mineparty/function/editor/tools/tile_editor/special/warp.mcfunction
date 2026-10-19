# Needs $(UUID)

# Summon data carrying marker
$summon marker ~ ~ ~ {Tags:["dialog_data"],data:{dialog:{"type":"minecraft:confirmation","title":"Special settings for \"warp\"","inputs":[{"type":"minecraft:text","key":"tag","label":{"text":"Tag filter:","hover_event":{"action":"show_text","value":"Makes you only able to warp to tiles with this tag. Leave blank to be able to warp to any other warp tile."}},"initial":""}],"yes":{"label":"Confirm changes","action":{"type":"minecraft:dynamic/run_command","template":"function mineparty:editor/tiles/edit_special {UUID:$(UUID),location:\"data.special.warp\",value:{tag:'\u0024(tag)'}}"}},"no":{"label":"Cancel"}}}}

# Set initial from special data from tile
$data modify entity @n[tag=dialog_data] data.dialog.inputs[0].initial set string entity @n[type=marker,tag=tile,nbt={UUID:$(UUID)}] data.special.warp.tag

# Show dialog 
function mineparty:dialog with entity @n[tag=dialog_data] data

# Clean up 
kill @e[type=marker,tag=dialog_data]