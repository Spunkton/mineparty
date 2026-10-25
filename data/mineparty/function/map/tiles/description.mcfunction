# Redirect to description function with name
# Needs $(name) and $(type)

execute store result score #fail_check mineparty run data get entity @n[tag=selected] data.description
$execute unless score #fail_check mineparty matches 0 run return run title @s actionbar ["[$(name)] ",{"nbt":"data.description","entity":"@n[tag=selected]","interpret":true}]
$execute as @s run function mineparty:map/tiles/description/$(type) {name:"$(name)"}