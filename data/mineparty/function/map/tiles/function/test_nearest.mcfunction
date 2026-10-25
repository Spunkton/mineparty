tag @a[tag=taking_turn] remove taking_turn
tag @s add taking_turn
tag @e[tag=landed_on] remove landed_on
tag @n[tag=tile] add landed_on
function mineparty:map/tiles/function with entity @n[tag=tile] data