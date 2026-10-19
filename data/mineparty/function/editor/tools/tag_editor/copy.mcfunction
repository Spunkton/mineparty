# Copy tile tags from the one looked at

# If the thingy alr has copied stuff
execute if items entity @s {type:"minecraft:filtered",slot_source:{type:"minecraft:slot_range",slots:"weapon.*"},item_filter:{predicates:{"minecraft:custom_data":{tag_editor:1b}}}} *[minecraft:custom_data~{tags:["tile"]}] run tellraw @s {"color":"gray","text":"Tag editor cleared."}
execute if items entity @s {type:"minecraft:filtered",slot_source:{type:"minecraft:slot_range",slots:"weapon.*"},item_filter:{predicates:{"minecraft:custom_data":{tag_editor:1b}}}} *[minecraft:custom_data~{tags:["tile"]}] run playsound minecraft:entity.painting.break player @s ~ ~ ~ 0.7 2
execute if items entity @s {type:"minecraft:filtered",slot_source:{type:"minecraft:slot_range",slots:"weapon.*"},item_filter:{predicates:{"minecraft:custom_data":{tag_editor:1b}}}} *[minecraft:custom_data~{tags:["tile"]}] run return run item modify entity @s {type:"minecraft:filtered",slot_source:{type:"minecraft:slot_range",slots:"weapon.*"},item_filter:{predicates:{"minecraft:custom_data":{tag_editor:1b}}}} {type:"minecraft:sequence",functions:[{type:"minecraft:set_name",name:{text:"Tag Editor",italic:0}},{type:"minecraft:set_components",components:{"!minecraft:lore":{},"!minecraft:enchantment_glint_override":{}}},{type:"minecraft:set_custom_data",tag:{tags:{}}}]}

# Cancel if no tiles are selected
execute unless entity @n[tag=selected] run title @s actionbar {"color":"red","text":"No tiles selected."}
execute unless entity @n[tag=selected] run return 0

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
execute if score #fail_check mineparty matches ..2 run data modify entity @n[tag=temp] equipment.head.components."minecraft:custom_name" set value {"color":"red","italic":false,"text":"Tag Eraser"}
### Give item back
item replace entity @s {type:"minecraft:filtered",slot_source:{type:"minecraft:slot_range",slots:"weapon.*"},item_filter:{predicates:{"minecraft:custom_data":{tag_editor:1b}}}} from entity @n[tag=temp] armor.head
### Set lore
##### Weird roundabout way to avoid copying inconsequential tags
summon marker ~ ~ ~ {Tags:[],CustomName:"temp_data"}
data modify entity @n[type=marker,name=temp_data] Tags set from entity @n[tag=selected] Tags
tag @n[type=marker,name=temp_data] remove selected
tag @n[type=marker,name=temp_data] remove tile
tag @n[type=marker,name=temp_data] remove pointed
execute if score #fail_check mineparty matches 3.. run item modify entity @s weapon.mainhand {type:"minecraft:set_lore",entity:"this",lore:[[{text:"Tags: ",color:"gray",italic:0},{nbt:"Tags",entity:"@n[type=marker,name=temp_data]",color:"gray",italic:0}]],mode:"replace_all"}
execute if score #fail_check mineparty matches 3.. run playsound minecraft:ui.loom.take_result player @s ~ ~ ~ 0.4 2
execute if score #fail_check mineparty matches ..2 run item modify entity @s weapon.mainhand {type:"minecraft:set_lore",entity:"this",lore:[],mode:"replace_all"}
execute if score #fail_check mineparty matches ..2 run playsound minecraft:block.fire.extinguish player @s ~ ~ ~ 0.4 2
kill @n[type=marker,name=temp_data]

# Notify
execute if score #fail_check mineparty matches 3.. run tellraw @s {"color":"gray","text":"Copied tags."}
execute if score #fail_check mineparty matches ..2 run tellraw @s {"color":"gray","text":"No tags found, swapped to eraser."}

# Clean up
kill @e[tag=temp,type=armor_stand]