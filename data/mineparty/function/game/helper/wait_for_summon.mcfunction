#Waits for the helper summoning item to spawn
execute at @n[type=item,nbt={Item:{components:{"minecraft:custom_data":{helper:true}}}}] run function mineparty:game/helper/summon
execute if entity @n[tag=helper] run kill @n[type=item,nbt={Item:{components:{"minecraft:custom_data":{helper:true}}}}]
execute if entity @n[tag=helper] run return 0

#Schedule self if no item has been found yet
schedule function mineparty:game/helper/wait_for_summon 1t