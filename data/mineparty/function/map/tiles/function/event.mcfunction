# Check if there is a command loaded
execute store result score #fail_check mineparty run data get entity @n[tag=tile,tag=landed_on] data.special.event.command
execute if score #fail_check mineparty matches 0 run return run function mineparty:map/tiles/function/event/no_command

# Run event function
function mineparty:command with entity @n[tag=tile,tag=landed_on] data.special.event