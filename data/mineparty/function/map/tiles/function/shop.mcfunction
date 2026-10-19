# Notif
tellraw @s "You visit the shop!"
tellraw @a[distance=.1..] [{"selector":"@s"}," visits the shop!"]

# Open shop
execute if entity @n[tag=landed_on] at @n[tag=tile,tag=landed_on] run function mineparty:map/tiles/function/shop/summon_all with entity @n[tag=tile] data
execute unless entity @n[tag=landed_on] at @n[tag=tile,tag=landed_on] run function mineparty:map/tiles/function/shop/summon_all with entity @n[tag=tile] data

# Give dismissal item
execute as @p[tag=taking_turn,tag=!host] run function mineparty:map/tiles/function/shop/dismiss_shopkeeper/give
execute as @p[tag=host] run function mineparty:map/tiles/function/shop/dismiss_shopkeeper/give