# Inputs data into entry, and puts entry into menu dialog
# Executed as player being added

# Create base entry
$summon marker ~ ~ ~ {Tags:["dialog_entry"],data:{entry:{"type":"minecraft:item","item":{"id":"minecraft:player_head","components":{"minecraft:profile":{"name":"$(name)"}}},"description":[{"text":"$(name)§l ","click_event":{"action":"show_dialog","dialog":{}}}],"width":1}}}

# Add little marker if player is host
execute if entity @s[tag=host] run data modify entity @n[tag=dialog_entry] data.entry.description append value {"color":"light_purple","text":"✎","hover_event":{"action":"show_text","value":"Host"}}

# Fill in the dialog that comes when you click the name
function mineparty:settings/host/player/dialog/create with entity @n[tag=player_data] Item.components."minecraft:profile"
data modify entity @n[tag=dialog_entry] data.entry.description[0].click_event.dialog set from storage mineparty:main function.output.dialog

# Put entry into player menu dialog
data modify entity @n[tag=dialog_data] data.dialog.body append from entity @n[tag=dialog_entry] data.entry

# Clean up
kill @e[tag=dialog_entry]