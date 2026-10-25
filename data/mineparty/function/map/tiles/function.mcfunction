# Redirect to description function with name
# Needs $(type) and $(name)

# If no player is taking their turn (absentee)
execute unless entity @p[tag=taking_turn] run function mineparty:game/player/absentee with storage mineparty:main turn
execute unless entity @p[tag=taking_turn] run return fail

# Notify
$tellraw @p[tag=taking_turn] "You landed on a $(name)."
$tellraw @a[tag=!taking_turn] ["",{"selector":"@p[tag=taking_turn]"}," landed on a $(name)."]

# Run tile function
$execute as @p[tag=taking_turn] at @s run function mineparty:map/tiles/function/$(type)

# Run bonus function if there
execute store result score #fail_check mineparty run data get entity @n[tag=landed_on] data.command
execute unless score #fail_check mineparty matches 0 run function mineparty:command with entity @n[tag=landed_on] data