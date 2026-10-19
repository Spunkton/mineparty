# Describes tile type
# Executor recieves the title
# Needs tile $(name)

execute store result score #fail_check mineparty run data get entity @n[tag=inspected] data.special.custom.description
$execute if score #fail_check mineparty matches 0 run title @s actionbar "[$(name)] Custom tile! You'll just have to land on it to see what it does."
$execute unless score #fail_check mineparty matches 0 run title @s actionbar ["[$(name)] ",{"nbt":"data.special.custom.description","entity":"@n[tag=inspected]","interpret":true}]