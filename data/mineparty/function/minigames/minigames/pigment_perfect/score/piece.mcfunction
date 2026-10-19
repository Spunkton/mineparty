# Scores a piece of clothing
# Needs $(part) and $(piece)

# Summon item to store equipment
summon item ~ ~ ~ {Tags:["pigment_perfect_score"],Item:{id:"minecraft:stone"}}
$item replace entity @n[tag=pigment_perfect_score] container.0 from entity @s {type:"minecraft:limit_slots",slot_source:{type:"minecraft:filtered",slot_source:"player",item_filter:{items:"minecraft:leather_$(piece)"}},limit:1}

# Calculate rgb values
### Red Mainhand
execute store result score #calc mineparty run data get entity @n[tag=pigment_perfect_score] Item.components."minecraft:dyed_color"
execute store result storage mineparty:math distance.color.rgb_a[0] int 1 run function mineparty:other/calc/div {amount:65536,input:"#calc mineparty"}
### Green Mainhand
execute store result score #calc mineparty run data get entity @n[tag=pigment_perfect_score] Item.components."minecraft:dyed_color"
function mineparty:other/calc/mod {amount:65536,input:"#calc mineparty"}
execute store result storage mineparty:math distance.color.rgb_a[1] int 1 run function mineparty:other/calc/div {amount:256,input:"#calc mineparty"}
### Blue Mainhand
execute store result score #calc mineparty run data get entity @n[tag=pigment_perfect_score] Item.components."minecraft:dyed_color"
execute store result storage mineparty:math distance.color.rgb_a[2] int 1 run function mineparty:other/calc/mod {amount:256,input:"#calc mineparty"}
### Red Offhand
$execute store result score #calc mineparty run data get entity @n[tag=pigment_perfect_reference] equipment.$(part).components."minecraft:dyed_color"
execute store result storage mineparty:math distance.color.rgb_b[0] int 1 run function mineparty:other/calc/div {amount:65536,input:"#calc mineparty"}
### Green Offhand
$execute store result score #calc mineparty run data get entity @n[tag=pigment_perfect_reference] equipment.$(part).components."minecraft:dyed_color"
function mineparty:other/calc/mod {amount:65536,input:"#calc mineparty"}
execute store result storage mineparty:math distance.color.rgb_b[1] int 1 run function mineparty:other/calc/div {amount:256,input:"#calc mineparty"}
### Blue Offhand
$execute store result score #calc mineparty run data get entity @n[tag=pigment_perfect_reference] equipment.$(part).components."minecraft:dyed_color"
execute store result storage mineparty:math distance.color.rgb_b[2] int 1 run function mineparty:other/calc/mod {amount:256,input:"#calc mineparty"}

# Run and store compute
$data modify storage mineparty:math result.$(part) set compute default float mineparty:minigames/pigment_perfect/color_distance
$execute store result score #$(part) minigames run compute default float mineparty:minigames/pigment_perfect/color_distance
# Make into percentage (meaningless but more fun to look at)
execute store result storage mineparty:math result.percentage int 1 run compute default float mineparty:minigames/pigment_perfect/color_distance_percentage

# If unpainted
$execute unless data entity @n[tag=pigment_perfect_score] Item.components."minecraft:dyed_color" run data modify storage mineparty:math result.$(part) set value 100f
execute unless data entity @n[tag=pigment_perfect_score] Item.components."minecraft:dyed_color" run data modify storage mineparty:math result.percentage set value 0

# Tell percentage
$tellraw @s ["$(display_name): ",{"storage":"mineparty:math","nbt":"result.percentage","hover_event":{"action":"show_text","value":["Reference RGB: ",{"nbt":"distance.color.rgb_b","storage":"mineparty:math"},"\nYour RGB:       \u00a7l ",{"nbt":"distance.color.rgb_a","storage":"mineparty:math"},"\nΔe = ",{"storage":"mineparty:math","nbt":"result.$(part)"}]}},"%"]

# Clean up
kill @n[tag=pigment_perfect_score]