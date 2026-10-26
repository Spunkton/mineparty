#Executes function based on trigger
execute as @a[scores={helper=1}] run function mineparty:game/helper/dialog/interaction/interact
execute as @a[scores={helper=11}] run function mineparty:game/pause
execute as @a[scores={helper=2}] run function mineparty:game/trigger/resend_buttons
execute as @a[scores={helper=3}] run function mineparty:game/tiles/tp_to_occupied with entity @s
execute as @a[scores={helper=4}] run tellraw @s {"color":"gray","text":"<Helper> Here you go!"}
execute as @a[scores={helper=4}] run function mineparty:game/dice/get/default
execute as @a[scores={helper=5}] run tellraw @s [{"color":"white","text":"\u00a7l========{Helper menu (2/2)}========"},{"color":"#9CFCFF","italic":false,"text":"\n█"},{"color":"#80FCFF","text":"███"},{"color":"#9CFCFF","text":"█"},{"bold":false,"click_event":{"action":"run_command","command":"trigger helper set 6"},"color":"#90BFFC","shadow_color":16777215,"text":" > [Show turn order]"},{"color":"#64FBFF","text":"\n█"},{"color":"#3DE0F7","text":"███"},{"color":"#64FBFF","text":"█"},{"bold":false,"click_event":{"action":"run_command","command":"trigger helper set 7"},"color":"light_purple","shadow_color":16777215,"text":" > [Pick for me!]"},{"color":"#3DE0F7","text":"\n█"},{"color":"#FFFFFF","text":"█"},{"color":"#3DE0F7","text":"█"},{"color":"#FFFFFF","text":"█"},{"color":"#3DE0F7","text":"█"},{"bold":false,"click_event":{"action":"run_command","command":"trigger helper set 8"},"color":"#CF90FC","shadow_color":16777215,"text":" > [Get Tile Inspector]"},{"color":"#4CE9FF","text":"\n█"},{"color":"#FFFFFF","text":"█"},{"color":"#4CE9FF","text":"█"},{"color":"#FFFFFF","text":"█"},{"color":"#4CE9FF","text":"█"},{"bold":false,"click_event":{"action":"run_command","command":"trigger helper set 9"},"color":"white","shadow_color":16777215,"text":" > [...]"},{"color":"#2CD5EC","text":"\n█"},{"color":"#3DE0F7","text":"███"},{"color":"#2CD5EC","text":"█"},{"bold":false,"click_event":{"action":"run_command","command":"trigger helper set 10"},"color":"gray","shadow_color":16777215,"text":" > [Settings]"}]
execute as @a[scores={helper=5}] run tellraw @s "\u00a7l================================="
execute as @a[scores={helper=6}] run function mineparty:game/start/turn_order/show
execute as @a[scores={helper=7}] store success score #fail_check mineparty run function mineparty:other/custom_trigger/pick_random
execute as @a[scores={helper=7}] if score #fail_check mineparty matches 1 run tellraw @s {"color":"gray","text":"Helper picked for you..."}
execute as @a[scores={helper=7}] if score #fail_check mineparty matches 0 run tellraw @s {"color":"red","text":"There is nothing to pick from right now."}
execute as @a[scores={helper=8}] run tellraw @s {"color":"gray","text":"<Helper> Got your eye on anything?"}
execute as @a[scores={helper=8}] run clear @s *[minecraft:custom_data~{tile_inspector:true}]
execute as @a[scores={helper=8}] run function mineparty:map/tiles/inspector/give
execute as @a[scores={helper=9}] run tellraw @s "... (WIP)"
execute as @a[scores={helper=10}] run function mineparty:settings/settings

#Resets trigger value
scoreboard players set @a helper 0