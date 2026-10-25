# Clears copied data from Tag Editor

# Sound effect
playsound minecraft:ui.toast.out player @s ~ ~ ~ 1 2
playsound minecraft:ui.toast.out player @s ~ ~ ~ 1 2
playsound minecraft:ui.toast.out player @s ~ ~ ~ 1 2

# Revert item to normal
item modify entity @s {type:"minecraft:filtered",slot_source:{type:"minecraft:slot_range",slots:"weapon.*"},item_filter:{predicates:{"minecraft:custom_data":{tag_editor:1b}}}} {type:"minecraft:sequence",functions:[{type:"minecraft:set_name",name:{text:"Tag Editor",italic:0}},{type:"minecraft:set_components",components:{"minecraft:lore":[{"color":"gray","italic":false,"text":"Edits tags for map/tile interaction"},[{"color":"gray","italic":false,"text":"Use "},{"color":"blue","keybind":"key.use"}," to ",{"underlined":true,"text":"edit"}," tile tags"],[{"color":"gray","italic":false,"text":"Use "},{"color":"blue","keybind":"key.attack"}," to ",{"underlined":true,"text":"copy"}," tile tags"]],"minecraft:enchantment_glint_override":false,"minecraft:item_model":"name_tag"}},{type:"minecraft:set_custom_data",tag:{tags:{}}}]}

# Debug notif
tellraw @s[tag=debug] {"color":"gray","text":"Tag editor cleared."}
