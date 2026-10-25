# Show host the prompt
tellraw @p[tag=host] {"color":"gold","text":"Prompt:"}
tellraw @p[tag=host] {"entity":"@n[tag=landed_on,tag=tile]","nbt":"data.special.prompt","interpret":true}
### Show dialog
summon marker ~ ~ ~ {Tags:["dialog_data"],data:{}}
data modify entity @n[tag=dialog_data] data.name set from entity @n[tag=landed_on,tag=tile] data.name
data modify entity @n[tag=dialog_data] data.block set from entity @n[tag=landed_on,tag=tile] data.block
data modify entity @n[tag=dialog_data] data.prompt set from entity @n[tag=landed_on,tag=tile] data.special.prompt
function mineparty:map/tiles/function/custom/prompt with entity @n[tag=dialog_data] data
kill @n[tag=dialog_data]

# Give host the continue option
execute as @p[tag=host] run function mineparty:game/host/continue/give