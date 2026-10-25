# Needs $(name), $(type), $(block), $(map), $(command) and $(description)
# Executed as player

$data modify entity @n[tag=selected] data.type set value "$(type)"
$data modify entity @n[tag=selected] data.name set value "$(name)"
$data modify entity @n[tag=selected] CustomName set value "$(name)"
$data modify entity @n[tag=selected] data.block set value "$(block)"
$data modify entity @n[tag=selected] data.map set value "$(map)"
$data modify entity @n[tag=selected] data.command set value "$(command)"
$data modify entity @n[tag=selected] data.description set value "$(description)"
$data modify entity @n[tag=selected] data.special set value $(special)

# Changes the block bottom
$execute if entity @s[predicate=!mineparty:sneaking] at @n[tag=selected] run fill ~-1 ~-1 ~-1 ~1 ~-1 ~1 $(block)

# Poof!
execute at @n[tag=selected] run particle poof ~ ~0.5 ~ 0.5 0 0.5 0 15 normal