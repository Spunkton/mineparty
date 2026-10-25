# Copy tile tags from the one looked at

# Add selected tag tile you're looking at
function mineparty:editor/tag_selected

# Clear data if sneaking or if no tiles are selected
execute if predicate mineparty:sneaking run function mineparty:editor/tools/tag_editor/clear
execute if predicate mineparty:sneaking run return run tag @e[tag=tile] remove selected
execute unless entity @n[tag=selected] run function mineparty:editor/tools/tag_editor/clear
execute unless entity @n[tag=selected] run return run tag @e[tag=tile] remove selected

# Summon stand to hold item
summon armor_stand ~ ~ ~ {Tags:["temp"],Invisible:1b}
### Copy item
item replace entity @n[tag=temp] armor.head from entity @s {type:"minecraft:filtered",slot_source:{type:"minecraft:slot_range",slots:"weapon.*"},item_filter:{predicates:{"minecraft:custom_data":{tag_editor:1b}}}}
### Modify data
data modify entity @n[tag=temp] equipment.head.components."minecraft:custom_data".tags set from entity @n[tag=selected] Tags
data modify entity @n[tag=temp] equipment.head.components."minecraft:enchantment_glint_override" set value true
### Decide name ("Paster" if it has tags, "Eraser" if there are none)
execute store result score #fail_check mineparty if data entity @n[tag=temp] equipment.head.components."minecraft:custom_data".tags[]
execute if score #fail_check mineparty matches 3.. run data modify entity @n[tag=temp] equipment.head.components."minecraft:custom_name" set value {"italic":false,"text":"Tag Paster"}
execute if score #fail_check mineparty matches 3.. run data modify entity @n[tag=temp] equipment.head.components."minecraft:item_model" set value "slime_ball"
execute if score #fail_check mineparty matches ..2 run data modify entity @n[tag=temp] equipment.head.components."minecraft:custom_name" set value {"color":"red","italic":false,"text":"Tag Eraser"}
execute if score #fail_check mineparty matches ..2 run data modify entity @n[tag=temp] equipment.head.components."minecraft:item_model" set value "magma_cream"
### Give item back
item replace entity @s {type:"minecraft:filtered",slot_source:{type:"minecraft:slot_range",slots:"weapon.*"},item_filter:{predicates:{"minecraft:custom_data":{tag_editor:1b}}}} from entity @n[tag=temp] armor.head
### Set lore with weird roundabout way to avoid copying inconsequential tags
summon marker ~ ~ ~ {Tags:[],CustomName:"temp_data"}
data modify entity @n[type=marker,name=temp_data] Tags set from entity @n[tag=selected] Tags
tag @n[type=marker,name=temp_data] remove selected
tag @n[type=marker,name=temp_data] remove tile
tag @n[type=marker,name=temp_data] remove pointed
execute if score #fail_check mineparty matches 3.. run item modify entity @s weapon.mainhand {type:"minecraft:set_lore",entity:"this",lore:[[{text:"Tags: ",color:"gray",italic:0},{nbt:"Tags",entity:"@n[type=marker,name=temp_data]",color:"gray",italic:0}],[{"color":"gray","italic":false,"text":"Use "},{"color":"blue","keybind":"key.use"}," to ",{"underlined":true,"text":"paste"}," tile tags"],[{"color":"gray","italic":false,"text":"Use "},{"color":"blue","keybind":"key.sneak"}," + ",{"color":"blue","keybind":"key.use"}," to ",{"underlined":true,"text":"add"}," tags to a tile"],[{"color":"gray","italic":false,"text":"Use "},{"color":"blue","keybind":"key.attack"}," to ",{"underlined":true,"text":"copy"}," new tile tags"],[{"color":"gray","italic":false,"text":"Use "},{"color":"blue","keybind":"key.sneak"}," + ",{"color":"blue","keybind":"key.attack"}," to ",{"underlined":true,"text":"switch"}," to Tag Editor"]],mode:"replace_all"}
execute if score #fail_check mineparty matches 3.. run playsound minecraft:ui.loom.take_result player @s ~ ~ ~ 0.6 2
execute if score #fail_check mineparty matches ..2 run item modify entity @s weapon.mainhand {type:"minecraft:set_lore",entity:"this",lore:[[{"color":"gray","italic":false,"text":"Use "},{"color":"blue","keybind":"key.use"}," to ",{"underlined":true,"text":"delete"}," tile tags"],[{"color":"gray","italic":false,"text":"Use "},{"color":"blue","keybind":"key.attack"}," to ",{"underlined":true,"text":"copy"}," new tile tags"],[{"color":"gray","italic":false,"text":"Use "},{"color":"blue","keybind":"key.sneak"}," + ",{"color":"blue","keybind":"key.attack"}," to ",{"underlined":true,"text":"switch"}," to Tag Editor"]],mode:"replace_all"}
execute if score #fail_check mineparty matches ..2 run playsound minecraft:block.fire.extinguish player @s ~ ~ ~ 0.4 2
##### Remove lore data
kill @n[type=marker,name=temp_data]

# Notify
execute if score #fail_check mineparty matches 3.. run tellraw @s[tag=debug] {"color":"gray","text":"Copied tags."}
execute if score #fail_check mineparty matches ..2 run tellraw @s[tag=debug] {"color":"gray","text":"No tags found, swapped to eraser."}

# Effects
execute at @n[tag=selected] run particle instant_effect{color:[0.800,1.000,0.600]} ~ ~ ~ 0.75 0 0.75 0 32 normal @s

# Clean up
kill @e[tag=temp,type=armor_stand]
tag @e[tag=tile] remove selected