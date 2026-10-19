advancement revoke @s only mineparty:game/dice

# Counts total numbers possible for roll
summon marker ~ ~ ~ {Tags:["score"]}
execute store result score @s dice_roll run data get entity @s SelectedItem.components."minecraft:custom_data".values
execute unless data entity @s SelectedItem.components."minecraft:custom_data".dice store result score @s dice_roll run data get entity @s equipment.offhand.components."minecraft:custom_data".values
execute store result entity @n[tag=score] data.length int 1 run scoreboard players remove @s dice_roll 1

# Get random n and pick nth number from list
function mineparty:game/dice/random_value with entity @n[tag=score] data
function mineparty:game/dice/roll with entity @n[tag=score] data

# Custom functions/ modifications if there are some
function mineparty:command with entity @s SelectedItem.components."minecraft:custom_data"
execute unless data entity @s SelectedItem.components."minecraft:custom_data".dice run function mineparty:command with entity @s equipment.offhand.components."minecraft:custom_data"
### Dice potion
execute if entity @s[tag=dice_potion] run scoreboard players add @s dice_roll 3
execute if entity @s[tag=dice_potion] run tellraw @s {"color":"green","text":"Your dice potion pushed your luck further!"}
tag @s remove dice_potion

# Tell result
title @s actionbar ["You rolled ",{"bold":true,"score":{"name":"*","objective":"dice_roll"}},"."]

# Tag self
tag @s add rolled_dice

# Cleanup
kill @n[tag=score]