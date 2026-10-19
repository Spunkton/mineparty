# Needs $(UUID)
# Same command as battle

# Summon data carrying marker
$summon marker ~ ~ ~ {Tags:["dialog_data"],data:{dialog:{"type":"minecraft:confirmation","title":"Special settings for \"high_stakes\"","inputs":[{"type":"minecraft:text","key":"tags","label":{"text":"Tag filter:","hover_event":{"action":"show_text","value":"Minigames played from this tile will be filtered for this tag"}},"initial":"comp"}],"yes":{"label":"Confirm changes","action":{"type":"minecraft:dynamic/run_command","template":"function mineparty:editor/tiles/edit_special {UUID:$(UUID),location:\"data.special.battle.tags\",value:[\u0024(tags)]}"}},"no":{"label":"Cancel"}}}}

# Set initial from special data from tile
$data modify entity @n[tag=dialog_data] data.dialog.inputs[0].initial set string entity @n[type=marker,tag=tile,nbt={UUID:$(UUID)}] data.special.battle.tags[]

# Show dialog 
function mineparty:dialog with entity @n[tag=dialog_data] data

# Clean up 
kill @e[type=marker,tag=dialog_data]