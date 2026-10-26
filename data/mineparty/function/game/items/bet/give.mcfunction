# Gives player a bet
# Executed as player
# Needs $(type) and $(amount)

# Summon item
execute at @s run summon item ~ ~ ~ {Tags:["give_item"],Item:{id:"minecraft:poisonous_potato",count:1,components:{"!minecraft:consumable":{},"minecraft:item_model":"map","minecraft:lore":[{"color":"gray","italic":false,"text":"An empty bet..."}],"minecraft:custom_name":{"italic":false,"text":"Bet"},"minecraft:custom_data":{bet:true,type:"none",amount:0,target:"none"},"minecraft:max_stack_size":1}}}

# Set owner
data modify entity @n[tag=give_item] Owner set from entity @s

# Set data based on 