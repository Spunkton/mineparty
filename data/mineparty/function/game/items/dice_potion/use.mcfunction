advancement revoke @s only mineparty:game/items/dice_potion

# If dice potion effect is already there
execute if entity @s[tag=dice_potion,gamemode=!creative] run function mineparty:game/items/dice_potion/give
execute if entity @s[tag=dice_potion] run tellraw @s {"color":"red","text":"You already used this item!"}
execute if entity @s[tag=dice_potion] run return fail

# Add tag
tag @s add dice_potion

# Message
tellraw @s {"color":"gray","text":"You feel your luck strengthen..."}
tellraw @a[distance=.1..] [{"color":"white","text":""},{"selector":"@s"}," used a dice potion!"]