# Activates trap!
# Activates while moving

# Effects
execute at @n[tag=move_update] run summon evoker_fangs
execute at @n[tag=move_update] run particle minecraft:ash ~ ~0.5 ~ 0.8 0 0.8 0 100
execute at @p[tag=moving] run particle minecraft:damage_indicator ~ ~ ~ 0 0 0 1 15
execute as @p[tag=moving] at @s run damage @s 0.1 minecraft:magic at ~ ~ ~
effect give @p[tag=moving] minecraft:slowness 1 5 true

# If there is nothing to lose
execute as @p[tag=moving] unless items entity @s player gold_ingot unless items entity @s player diamond run tellraw @s [{"color":"white","text":"You got trapped, but you have nothing to lose!"}]
execute as @p[tag=moving] unless items entity @s player gold_ingot unless items entity @s player diamond run tellraw @a[tag=!moving] [{"color":"white","text":""},{"selector":"@s"}," got trapped, but they have nothing to lose!"]
execute as @p[tag=moving] unless items entity @s player gold_ingot unless items entity @s player diamond run return 0

# If there is no gold...
execute as @p[tag=moving] unless items entity @s player gold_ingot run tellraw @s [{"color":"dark_red","text":"You got TRAPPED and had no gold, so you lost a DIAMOND!"}]
execute as @p[tag=moving] unless items entity @s player gold_ingot run tellraw @a[tag=!moving] [{"color":"dark_red","text":""},{"selector":"@s"}," got TRAPPED and had no gold, so they lost a DIAMOND!"]
execute as @p[tag=moving] unless items entity @s player gold_ingot run clear @s diamond 1
execute as @p[tag=moving] unless items entity @s player gold_ingot run return 1

# Remove gold
execute as @p[tag=moving] run tellraw @s [{"color":"red","text":"You got trapped and lost some gold!"}]
execute as @p[tag=moving] run tellraw @a[tag=!moving] [{"color":"dark_red","text":""},{"selector":"@s"}," got trapped and lost some gold!"]
execute as @p[tag=moving] run return run clear @s gold_ingot 10