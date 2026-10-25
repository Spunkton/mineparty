# If a specially linked tile is passed

# Key
### Effects
execute at @n[tag=move_update,tag=move_to_key] run particle block{block_state:{id:"minecraft:vault",properties:{ominous:"false",vault_state:"ejecting"}}} ~ ~1 ~ 0.2 0.2 0.2 1 30 normal
execute at @n[tag=move_update,tag=move_to_key] run playsound minecraft:block.vault.insert_item block @a ~ ~ ~ 1 1
execute at @n[tag=move_update,tag=move_to_key] run playsound minecraft:block.vault.break block @a ~ ~ ~ 0.5 0.7
### Notification
execute at @n[tag=move_update,tag=move_to_key] run tellraw @a [{"color":"gold","text":""},{"selector":"@p[tag=moving]"}," unlocked the tile with a key!"]
### Take Key
clear @p[tag=moving] *[minecraft:custom_data~{key:true}] 1
### Unlock tile
$execute if entity @n[tag=move_update,tag=move_to_key] run data modify entity @n[tag=move_past] data.links[{UUID:$(to)}].unlocked set value true

# Super key
### Effects
execute at @n[tag=move_update,tag=move_to_super_key] run particle block{block_state:{id:"minecraft:vault",properties:{ominous:"true",vault_state:"ejecting"}}} ~ ~1 ~ 0.2 0.2 0.2 1 30 normal
execute at @n[tag=move_update,tag=move_to_super_key] run particle minecraft:end_rod ~ ~1 ~ 0 0 0 0.01 5 normal
execute at @n[tag=move_update,tag=move_to_super_key] run playsound minecraft:block.end_portal.spawn block @a ~ ~ ~ 0.2 2
execute at @n[tag=move_update,tag=move_to_super_key] run playsound minecraft:block.vault.break block @a ~ ~ ~ 0.5 0.7
### Notification
execute at @n[tag=move_update,tag=move_to_super_key] run tellraw @a [{"color":"gold","text":""},{"selector":"@p[tag=moving]"}," unlocked the tile with a SUPER key!"]
### Take Super key
clear @p[tag=moving] *[minecraft:custom_data~{super_key:true}] 1
### Unlock tile
$execute if entity @n[tag=move_update,tag=move_to_super_key] run data modify entity @n[tag=move_past] data.links[{UUID:$(to)}].unlocked set value true

# Toll
### Effects
execute at @n[tag=move_update,tag=move_to_toll] run particle minecraft:end_rod ~ ~1 ~ 0 0 0 0.01 5 normal
execute at @n[tag=move_update,tag=move_to_toll] run playsound minecraft:item.armor.equip_chain block @a ~ ~ ~ 1 0.8
### Notification
$execute at @n[tag=move_update,tag=move_to_toll] run tellraw @a [{"color":"gold","text":""},{"selector":"@p[tag=moving]"}," paid $(amount) gold to pass the tile."]
### Take gold
$clear @p[tag=moving] gold_ingot $(amount)