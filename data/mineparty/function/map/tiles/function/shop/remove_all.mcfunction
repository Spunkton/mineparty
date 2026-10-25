# You don't wanna hear or see the villager die
effect give @n[tag=shopkeeper] minecraft:invisibility infinite 0 true
attribute @n[tag=shopkeeper] scale base set 0
data modify entity @n[tag=shopkeeper] Silent set value true

# Poof away
execute at @n[tag=shop_stall] unless data entity @n[tag=tile] data.special.direction as @n[tag=tile] at @s run particle poof ~3 ~1 ~ 1 1 1 0 500
execute at @n[tag=shop_stall] if data entity @n[tag=tile] {data:{special:{direction:"east"}}} as @n[tag=tile] at @s run particle poof ~3 ~1 ~ 1 1 1 0 500
execute at @n[tag=shop_stall] if data entity @n[tag=tile] {data:{special:{direction:"south"}}} as @n[tag=tile] at @s run particle poof ~ ~1 ~3 1 1 1 0 500
execute at @n[tag=shop_stall] if data entity @n[tag=tile] {data:{special:{direction:"west"}}} as @n[tag=tile] at @s run particle poof ~-3 ~1 ~ 1 1 1 0 500
execute at @n[tag=shop_stall] if data entity @n[tag=tile] {data:{special:{direction:"north"}}} as @n[tag=tile] at @s run particle poof ~ ~1 ~-3 1 1 1 0 500

# Kill!
kill @e[type=villager,tag=shopkeeper]
kill @e[tag=shop_stall]

# Sounds!
playsound minecraft:block.note_block.chime block @a ~ ~ ~
playsound minecraft:entity.breeze.charge block @a ~ ~ ~
playsound minecraft:entity.wind_charge.wind_burst block @a ~ ~ ~ 0.6 0.5