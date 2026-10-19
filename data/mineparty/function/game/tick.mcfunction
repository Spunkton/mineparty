# Other functions
function mineparty:game/helper/tick
function mineparty:game/trigger
function mineparty:game/items/tick

# Enable/ disable trigger
scoreboard players enable @a[tag=!trigger_disabled] helper
execute as @a[tag=trigger_disabled] run trigger helper set 0

# Feed us
effect give @a[gamemode=adventure] minecraft:saturation infinite 9 true

# Disable/enable die
execute as @a[tag=dice_disabled] if items entity @s weapon.mainhand *[minecraft:custom_data~{dice:true}] run item modify entity @s weapon.mainhand mineparty:dice/disable
execute as @a[tag=dice_disabled] if items entity @s weapon.offhand *[minecraft:custom_data~{dice:true}] run item modify entity @s weapon.offhand mineparty:dice/disable
execute as @a[tag=!dice_disabled] if items entity @s weapon.mainhand *[minecraft:custom_data~{dice:true}] run item modify entity @s weapon.mainhand mineparty:dice/enable
execute as @a[tag=!dice_disabled] if items entity @s weapon.offhand *[minecraft:custom_data~{dice:true}] run item modify entity @s weapon.offhand mineparty:dice/enable

# Ignore stuff if game is not active
execute unless data storage mineparty:main playing_game run return fail

# Check if a new player joined
execute as @a unless entity @s[tag=not_playing,tag=!temp_not_playing] unless score @s gold matches 0.. run function mineparty:game/player/latecomer with entity @s

# Scoreboard check and update
function mineparty:game/scoreboard/compare_checksum

# No cheesing
execute as @e[type=item,predicate=mineparty:item/is_gold] at @s on origin if entity @s[tag=taking_turn,tag=!host] as @n[type=item,predicate=mineparty:item/is_gold] run data modify entity @s PickupDelay set value 0
execute as @e[type=item,predicate=mineparty:item/is_gold] at @s on origin if entity @s[tag=taking_turn,tag=!host] as @n[type=item,predicate=mineparty:item/is_gold] run data modify entity @s Owner set from entity @s Thrower
execute as @e[type=item,predicate=mineparty:item/is_diamond] at @s on origin if entity @s[tag=!not_playing,tag=!host] as @n[type=item,predicate=mineparty:item/is_diamond] run data modify entity @s PickupDelay set value 0
execute as @e[type=item,predicate=mineparty:item/is_diamond] at @s on origin if entity @s[tag=!not_playing,tag=!host] as @n[type=item,predicate=mineparty:item/is_diamond] run data modify entity @s Owner set from entity @s Thrower
execute as @e[type=item,predicate=mineparty:item/is_gold] on origin if entity @s[tag=taking_turn,tag=!host] run tellraw @s "\u00a7cYou cannot drop gold during your turn."
execute as @e[type=item,predicate=mineparty:item/is_diamond] at @s on origin if entity @s[tag=!not_playing,tag=!host] run tellraw @s "\u00a7cDon't drop your diamonds, you need those!"

# Fancy time animation
execute store result score #time mineparty run time query minecraft:day
scoreboard players operation #time_diff mineparty = target_time mineparty
scoreboard players operation #time_diff mineparty -= #time mineparty
execute unless score #time_diff mineparty matches -12000..12000 run function mineparty:other/calc/mod {input:"#time_diff mineparty",amount:24000}
execute store result storage mineparty:main time.amount int 1 run function mineparty:other/calc/div {input:"#time_diff mineparty",amount:20}
execute unless score #time_diff mineparty matches -4..4 run function mineparty:game/other/time with storage mineparty:main time