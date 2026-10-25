# Needs $(id), $(name), $(diamond_price), $(minigame_prize), and $(shop_items)

# Tag self
tag @s add self

# Store data
$data merge storage mineparty:maps {maps:{$(id):{id:"$(id)",name:"$(name)",diamond_price:$(diamond_price),minigame_prize:$(minigame_prize)}}}
$execute unless data storage mineparty:maps maps.$(id).shop.pool run data modify storage mineparty:maps maps.$(id).shop.pool set from storage mineparty:maps default.shop.pool

# Add tags
$data modify storage mineparty:maps maps.$(id).tags set value []
tellraw @s[tag=debug] {"color":"gray","text":"Adding tags..."}
### Key?
$execute if entity @n[tag=tile,nbt={data:{map:"$(id)",links:[{type:key}]}}] run tellraw @s[tag=debug] {"color":"gray","text":"Added tag \"key\"."}
$execute if entity @n[tag=tile,nbt={data:{map:"$(id)",links:[{type:key}]}}] run data modify storage mineparty:maps maps.$(id).tags append value {key:true}

# Warnings
$execute as @e[tag=tile,nbt={data:{map:"$(id)"}}] unless data entity @s data.links[] run tellraw @p[tag=self] {"color":"red","text":"Warning: Map contains dead ends."}

# Notif
$tellraw @s {"color":"green","text":"Saved map \"$(name)\"!"}

# Clean up
tag @s remove self