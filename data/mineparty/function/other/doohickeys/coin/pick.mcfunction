# Executed as coin_item (ridden by interaction and item display)

# If caught in the air
execute if entity @s[tag=!landed] run playsound minecraft:block.amethyst_block.fall player @a ~ ~ ~ 1 1
execute if entity @s[tag=!landed] run particle minecraft:wax_on ~ ~ ~ 0 0 0 10 30
execute if entity @s[tag=!landed] run particle minecraft:end_rod ~ ~ ~ 0 0 0 0.3 30

# Sounds!
playsound minecraft:entity.item.pickup player @a ~ ~ ~ 1 1

# Roll heads or tails
execute store result score #coin_result mineparty run random value 0..1
execute if score #coin_result mineparty matches 0 on passengers on target run title @s actionbar "Heads!"
execute if score #coin_result mineparty matches 0 on passengers on target run tellraw @s "Heads!"
execute if score #coin_result mineparty matches 1 on passengers on target run title @s actionbar "Tails!"
execute if score #coin_result mineparty matches 1 on passengers on target run tellraw @s "Tails!"

# Give player the coin back
execute on passengers on target run function mineparty:other/doohickeys/coin/get

# Kill self and passengers
execute on passengers run kill @s
kill @s