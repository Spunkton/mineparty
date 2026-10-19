advancement revoke @s only mineparty:game/items/fishy_rod

# Tag self
tag @s add fishy_hooking

# Tag player that is hooked
execute as @e[type=fishing_bobber,tag=fishy_bobber] at @s on origin if entity @s[tag=fishy_hooking] positioned ~ ~-1.44 ~ run tag @p[distance=..1] add fishy_hooked

# Steal item
execute unless items entity @p[tag=fishy_hooked] mineparty:game/has_game_item * run tellraw @a ["",{"selector":"@s"}," stole \u00a765 gold\u00a7r from ",{"selector":"@p[tag=fishy_hooked]"},"!"]
execute unless items entity @p[tag=fishy_hooked] mineparty:game/has_game_item * run clear @p[tag=fishy_hooked] gold_ingot 5
execute unless items entity @p[tag=fishy_hooked] mineparty:game/has_game_item * run give @s gold_ingot 5
execute if items entity @p[tag=fishy_hooked] mineparty:game/has_game_item * run function mineparty:game/items/fishy_rod/steal

# Effects!
execute at @p[tag=fishy_hooked] run particle minecraft:angry_villager ~ ~2 ~ 0 0 0 0 0
playsound minecraft:entity.fishing_bobber.retrieve player @a ~ ~ ~ 1 0.5 1
playsound minecraft:block.chain.hit player @a ~ ~ ~ 1 0.5 1
execute as @p[tag=fishy_hooked] at @s run playsound minecraft:entity.fishing_bobber.splash player @s ~ ~ ~ 1 1

# Remove tags
tag @s remove fishy_hooking
tag @a remove fishy_hooked

# Remove rod
clear @s *[minecraft:custom_data~{fishy_rod:true}] 1