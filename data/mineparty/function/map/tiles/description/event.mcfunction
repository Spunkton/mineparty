# Describes tile type
# Executor recieves the title
# Needs tile $(name)

execute store result score #fail_check mineparty run data get entity @n[tag=inspected] data.special.event.description
$execute if score #fail_check mineparty matches 0 run title @s actionbar "[$(name)] Something unusual happens on this tile, look around for context clues."
$execute unless score #fail_check mineparty matches 0 run title @s actionbar ["[$(name)] ",{"nbt":"data.special.event.description","entity":"@n[tag=inspected]","interpret":true}]