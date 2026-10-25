# Draws pool from $(map)

# Summon base villager (hi Marco!)
summon villager ~3 ~ ~ {NoGravity:1b,Invulnerable:1b,Team:"no_collision",attributes:[{id:"minecraft:movement_speed",base:0}],Tags:["shopkeeper"],CustomName:"Marco",VillagerData:{level:99,profession:"minecraft:librarian"}}
execute if data entity @n[tag=tile] {data:{special:{direction:"south"}}} run tp @n[tag=shopkeeper] ~ ~ ~3
execute if data entity @n[tag=tile] {data:{special:{direction:"west"}}} run tp @n[tag=shopkeeper] ~-3 ~ ~
execute if data entity @n[tag=tile] {data:{special:{direction:"north"}}} run tp @n[tag=shopkeeper] ~ ~ ~-3


# Set up temp pool to play with
$data modify storage mineparty:maps maps.$(map).shop.temp.pool set from storage mineparty:maps maps.$(map).shop.pool

# Summon 64 markers to do your bidding (although only 5 are needed)
function mineparty:other/summon_64
$execute as @e[tag=64,limit=5] at @s run function mineparty:map/tiles/function/shop/summon_villager/draw_item {map:"$(map)"}
$execute if data storage mineparty:maps maps.$(map).tags[{key:true}] run data modify entity @n[type=villager,tag=shopkeeper] Offers.Recipes append value {rewardExp:0b,maxUses:1,buy:{id:"minecraft:gold_ingot",count:5},sell:{components:{"minecraft:item_model":"minecraft:trial_key","minecraft:custom_name":{text:"Key",italic:0b},"minecraft:custom_data":{game_item:1b,key:1b}},count:1,id:"minecraft:flint"}}

# Clean up
kill @e[tag=64]
$data remove storage mineparty:maps maps.$(map).shop.temp