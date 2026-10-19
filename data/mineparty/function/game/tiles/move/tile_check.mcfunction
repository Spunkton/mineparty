# Checks if landing on this tile would end you turn early
# Needs $(from), $(to), and $(amount)

# If no_passage
execute unless score #steps mineparty matches ..1 if entity @s[tag=no_passage] as @e[distance=..3,tag=move_to_indicator] run data modify entity @s glow_color_override set value -11500
execute unless score #steps mineparty matches ..1 if entity @s[tag=no_passage] as @e[distance=..3,tag=move_to_indicator] run data modify entity @s block_state set value "yellow_wool"
execute unless score #steps mineparty matches ..1 if entity @s[tag=no_passage] as @e[distance=..3,tag=move_to_indicator] run tag @s add no_passage_temp

# If diamond tile
execute if entity @s[tag=diamond] as @e[distance=..3,tag=move_to_indicator] run data modify entity @s glow_color_override set value -11141121
execute if entity @s[tag=diamond] as @e[distance=..3,tag=move_to_indicator] run data modify entity @s block_state set value "diamond_block"
execute if entity @s[tag=diamond] at @s run particle minecraft:trial_spawner_detection_ominous ~ ~ ~ 1 0 1 0.05 1
execute if entity @s[tag=diamond] as @e[type=item_display,tag=orbit,tag=clockwise,tag=!transit] at @s run tp @s ~ ~ ~ ~3 ~
execute if entity @s[tag=diamond] as @e[type=item_display,tag=orbit,tag=counter,tag=!transit] at @s run tp @s ~ ~ ~ ~-3 ~ 


# If special link type
### Item indicator
execute if entity @s[tag=special_link,tag=move_to_key] at @s unless entity @n[distance=..3,tag=special_link_indicator] run summon item_display ~ ~1 ~ {billboard:"center",Tags:["special_link_indicator","tile_indicator"],item:{id:"minecraft:trial_key",count:1}}
execute if entity @s[tag=special_link,tag=move_to_super_key] at @s unless entity @n[distance=..3,tag=special_link_indicator] run summon item_display ~ ~1 ~ {billboard:"center",Tags:["special_link_indicator","tile_indicator"],item:{id:"minecraft:ominous_trial_key",count:1}}
execute if entity @s[tag=move_to_barrier] at @s unless entity @n[distance=..3,tag=special_link_indicator] run summon item_display ~ ~1 ~ {billboard:"fixed",Tags:["special_link_indicator","tile_indicator"],item:{id:"minecraft:player_head",count:1,components:{"minecraft:profile":{"properties":[{"name":"textures","value":"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvNzk3OTU1NDYyZTRlNTc2NjY0NDk5YWM0YTFjNTcyZjYxNDNmMTlhZDJkNjE5NDc3NjE5OGY4ZDEzNmZkYjIifX19"}]}}}}
execute if entity @s[tag=move_to_toll] at @s unless entity @n[distance=..3,tag=special_link_indicator] run summon item_display ~ ~1 ~ {billboard:"center",Tags:["special_link_indicator","tile_indicator"],item:{id:"minecraft:gold_ingot",count:1}}
### Check if player is allowed to pass
### Key
execute if entity @s[tag=special_link,tag=move_to_key,tag=!unlocked] store result score #fail_check mineparty run clear @p[tag=moving] *[minecraft:custom_data~{key:true}] 0
execute if entity @s[tag=special_link,tag=move_to_key,tag=!unlocked] unless score #fail_check mineparty matches 1.. run tag @s add impassable
### Super Key
execute if entity @s[tag=special_link,tag=move_to_super_key,tag=!unlocked] store result score #fail_check mineparty run clear @p[tag=moving] *[minecraft:custom_data~{super_key:true}] 0
execute if entity @s[tag=special_link,tag=move_to_super_key,tag=!unlocked] unless score #fail_check mineparty matches 1.. run tag @s add impassable
### Toll
$execute if entity @s[tag=move_to_toll] unless score @p[tag=moving] gold matches $(amount).. run tag @s add impassable
### Barrier
$execute if entity @s[tag=move_to_barrier] unless score #steps mineparty matches $(amount).. run tag @s add impassable

# If impassable
execute if entity @s[tag=impassable] as @e[distance=..3,tag=move_to_indicator] run data modify entity @s glow_color_override set value -43691
execute if entity @s[tag=impassable] as @e[distance=..3,tag=move_to_indicator] run data modify entity @s block_state set value "red_wool"
### Else
execute if entity @s[tag=special_link,tag=!impassable] as @e[distance=..3,tag=move_to_indicator] run data modify entity @s glow_color_override set value -11141291
execute if entity @s[tag=special_link,tag=!impassable] as @e[distance=..3,tag=move_to_indicator] run data modify entity @s block_state set value "lime_wool"

# If dead end
$execute unless score #steps mineparty matches ..1 if entity @n[tag=move_from,nbt={UUID:$(from)}] unless data entity @s data.links[1] as @e[distance=..3,tag=move_to_indicator] run data modify entity @s glow_color_override set value -11500
$execute unless score #steps mineparty matches ..1 if entity @n[tag=move_from,nbt={UUID:$(from)}] unless data entity @s data.links[1] as @e[distance=..3,tag=move_to_indicator] run data modify entity @s block_state set value "yellow_wool"
$execute unless score #steps mineparty matches ..1 if entity @n[tag=move_from,nbt={UUID:$(from)}] unless data entity @s data.links[1] as @e[distance=..3,tag=move_to_indicator] run tag @s add no_passage_temp