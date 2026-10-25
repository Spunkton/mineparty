# Needs $(name), $(type), $(block), $(map), $(command), $(description) and $(special)

# Summon item
$execute at @s run summon item ~ ~ ~ {Tags:["give_item"],Item:{id:"happy_ghast_spawn_egg",components:{attribute_modifiers:[{id:"block_interaction_range",type:"block_interaction_range",amount:6,operation:"add_value",slot:"hand",display:{type:"hidden"}}],entity_data:{id:"minecraft:marker",Tags:["tile","new"],CustomName:"$(name)",data:{type:"$(type)",color:"white",map:"$(map)",block:"$(block)",command:"$(command)",description:"$(description)",special:$(special),links:[]}},custom_name:{"italic":false,"text":"Spawn $(name)"},custom_data:{editor_tool:true,tile_spawner:true,copied_tile_spawner:true,command:"function mineparty:editor/tools/tile_spawner/copy"},lore:[{"color":"yellow","italic":false,"text":"Map: $(map)"},{"color":"aqua","italic":false,"text":"Type: $(type)"}],item_model:"$(block)",max_stack_size:1,enchantments:{"mineparty:left_click_function":1},piercing_weapon:{deals_knockback:false,dismounts:false,sound:{sound_id:"none"}},enchantment_glint_override:true,tooltip_display:{hidden_components:["enchantments"]}}}}

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