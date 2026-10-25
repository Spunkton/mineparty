# Needs $(UUID)

# Summon data carrying marker
$summon marker ~ ~ ~ {Tags:["dialog_data"],data:{dialog:{"type":"minecraft:confirmation","title":"Special settings","body":[{"type":"minecraft:item","item":{"id":"minecraft:test_block",components:{block_state:{mode:"accept"}}}},{"type":"minecraft:plain_message","contents":["",{"color":"gold","text":"======= Edit Special Data ======="},{"color":"aqua","text":"\n\nTile type: "},"Lucky"]}],"inputs":[{"type":"minecraft:text","key":"tags","label":{"text":"Tag filter:","hover_event":{"action":"show_text","value":"Lucky destination tiles will be filtered for this tag. (\"lucky_warp\" is always filtered for.)"}},"initial":""}],"yes":{"label":"Confirm changes","action":{"type":"minecraft:dynamic/run_command","template":"function mineparty:editor/tiles/edit_special {UUID:$(UUID),location:\"data.special\",value:{tags:'\u0024(tags)'}}"}},"no":{"label":"Cancel"}}}}

# Set initial from special data from tile
$data modify entity @n[tag=dialog_data] data.dialog.inputs[0].initial set string entity @n[type=marker,tag=tile,nbt={UUID:$(UUID)}] data.special.tags

# Show dialog 
function mineparty:dialog with entity @n[tag=dialog_data] data

# Clean up 
kill @e[type=marker,tag=dialog_data]