# Remove tile with diamond

# Cool explosion
execute as @n[tag=diamond] at @s run particle minecraft:end_rod ~ ~ ~ 0 0 0 0.3 100
execute as @n[tag=diamond] at @s run playsound minecraft:block.amethyst_cluster.break block @a ~ ~ ~ 1 1 1
execute as @n[tag=diamond] at @s run playsound minecraft:entity.puffer_fish.blow_out block @a ~ ~ ~ 1 0 1


# Kill diamond indicators
kill @e[tag=diamond_indicator]

# Blacklist the 10 closest tiles
tag @n[tag=diamond] add blacklist
tag @n[tag=diamond] add double_blacklist

# Remove tag
tag @n[tag=diamond] remove diamond