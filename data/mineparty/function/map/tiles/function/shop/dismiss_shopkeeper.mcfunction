advancement revoke @s only mineparty:map/tiles/dismiss_shopkeeper

# Clear items
clear @a *[minecraft:custom_data~{dismiss_shopkeeper:true}]

# Removes shopkeeper and continues the game
function mineparty:map/tiles/function/shop/remove_all
tellraw @s {"color":"gray","text":"You dismissed the shopkeeper."}
tellraw @a ["<Marco> Farewell ",{"selector":"@p[tag=taking_turn]"},", may our paths cross once more..."]

# Schedule next thing
schedule function mineparty:command_queue 3s