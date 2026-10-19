advancement revoke @s only mineparty:map/tiles/interacted_with_shopkeeper

# Goal of this function is to prevent players who are not taking their turn from interacting with the shopkeeper

execute if entity @s[tag=taking_turn] unless data entity @n[tag=shopkeeper] Offers.Recipes run function mineparty:map/tiles/function/shop/allow_trade
execute if entity @s[tag=!taking_turn] if data entity @n[tag=shopkeeper] Offers.Recipes run schedule function mineparty:map/tiles/function/shop/allow_trade 2t
execute if entity @s[tag=!taking_turn] if data entity @n[tag=shopkeeper] Offers.Recipes run function mineparty:map/tiles/function/shop/block_trade
execute if entity @s[tag=!taking_turn] run tellraw @s {"color":"gray","text":"You cannot trade outside of your turn."}
execute if entity @s[tag=!taking_turn] at @n[tag=shopkeeper] run particle minecraft:angry_villager ~ ~2 ~ 0 0 0 0 1