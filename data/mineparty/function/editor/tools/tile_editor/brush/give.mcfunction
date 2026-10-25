# Needs $(name), $(type), $(block), $(map), $(command), $(description) and $(special)

# Summon item
$execute at @s run summon item ~ ~ ~ {Tags:["give_item"],Item:{id:"brick",components:{consumable:{consume_seconds:0,animation:"none",sound:"minecraft:item.brush.brushing.generic",has_consume_particles:false,on_consume_effects:[{type:"minecraft:play_sound",sound:{sound_id:""}}]},custom_name:{"italic":false,"text":"Tile Brush ($(name))"},custom_data:{editor_tool:true,tile_brush:true,command:"function mineparty:editor/tools/tile_editor/copy",brush:{name:"$(name)",type:"$(type)",block:"$(block)",map:"$(map)",command:"$(command)",description:"$(description)",special:$(special)}},lore:[{"color":"yellow","italic":false,"text":"Map: $(map)"},{"color":"aqua","italic":false,"text":"Type: $(type)"}],item_model:"brush",max_stack_size:1,enchantments:{"mineparty:left_click_function":1},piercing_weapon:{deals_knockback:false,dismounts:false,sound:{sound_id:"none"}},enchantment_glint_override:true,tooltip_display:{hidden_components:["enchantments"]}}}}

# Own item
data modify entity @n[tag=give_item] Owner set from entity @s UUID

# Add lore if it has bonus data
### Check for custom data
$data modify storage mineparty:temp blank_check set value {command:"$(command)",description:"$(description)"}
### If command exists
execute store result score #fail_check mineparty run data get storage mineparty:temp blank_check.command
$execute unless score #fail_check mineparty matches 0 run data modify entity @n[tag=give_item] Item.components."minecraft:lore" append value {"color":"light_purple","italic":false,"text":"Bonus Command: $(command)"}
### If description exists
execute store result score #fail_check mineparty run data get storage mineparty:temp blank_check.description
$execute unless score #fail_check mineparty matches 0 run data modify entity @n[tag=give_item] Item.components."minecraft:lore" append value {"color":"green","italic":false,"text":"Custom Description: $(description)"}

# Clean up
data remove storage mineparty:temp blank_check