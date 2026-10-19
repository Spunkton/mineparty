# Sets up settings dialog

# Summon marker to store data in
summon marker ~ ~ ~ {Tags:["dialog_data"],data:{latecomer_chooses:0,auto_sideline:0,ignore:0,afk_kick:0,sideliner_share:0,debug_mode:0,paused:"⏸ Pause"}}

# Fill dialog to mirror game status
execute if data storage mineparty:main settings.[{latecomers:"latecomer_chooses"}] run data modify entity @n[tag=dialog_data] data.latecomer_chooses set value true
execute if data storage mineparty:main settings.[{latecomers:"auto_sideline"}] run data modify entity @n[tag=dialog_data] data.auto_sideline set value true
execute if data storage mineparty:main settings.[{latecomers:"ignore"}] run data modify entity @n[tag=dialog_data] data.ignore set value true
execute if data storage mineparty:main settings.[{afk_kick:true}] run data modify entity @n[tag=dialog_data] data.afk_kick set value true
execute if data storage mineparty:main settings.[{sideliner_share:true}] run data modify entity @n[tag=dialog_data] data.sideliner_share set value true
execute if entity @s[tag=debug] run data modify entity @n[tag=dialog_data] data.debug_mode set value true
execute if score pause mineparty matches 1 run data modify entity @n[tag=dialog_data] data.paused set value "▶ Unpause"

# Show dialog
function mineparty:settings/host/dialog with entity @n[tag=dialog_data] data

# Kill data holder
kill @n[tag=dialog_data]