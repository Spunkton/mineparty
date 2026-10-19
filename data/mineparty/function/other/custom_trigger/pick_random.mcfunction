# Executed as player triggering

# Count the custom_trigger options
execute store result score #custom_triggers mineparty run data get storage mineparty:main custom_trigger
execute if score #custom_triggers mineparty matches 0 run return fail
execute store result storage mineparty:main temp.max int 1 run scoreboard players remove #custom_triggers mineparty 1


# Pick random number
data modify storage mineparty:main temp.min set value 0
execute store result storage mineparty:main temp.number int 1 run function mineparty:other/calc/random with storage mineparty:main temp

# Trigger that number
function mineparty:other/custom_trigger/pick_random/trigger with storage mineparty:main temp

# Return fail if you weren't allowed to trigger
execute if score #fail_check mineparty matches 0 run return fail

return 1