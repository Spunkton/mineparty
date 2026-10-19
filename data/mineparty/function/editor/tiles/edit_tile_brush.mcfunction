#Needs $(name), $(type), $(block), $(map)
#Executed as player

$data modify entity @n[tag=selected] data.type set value "$(type)"
$data modify entity @n[tag=selected] data.name set value "$(name)"
$data modify entity @n[tag=selected] CustomName set value "$(name)"
$data modify entity @n[tag=selected] data.block set value "$(block)"
$data modify entity @n[tag=selected] data.map set value "$(map)"

#Changes the block bottom
$execute at @n[tag=selected] run fill ~-1 ~-1 ~-1 ~1 ~-1 ~1 $(block)

#Poof!
execute at @n[tag=selected] run particle poof ~ ~0.5 ~ 0.5 0 0.5 0 15 normal