# Executed as player buying diamond

# Setup custom trigger
execute as @a run trigger mineparty_custom_trigger set -1
scoreboard players enable @s mineparty_custom_trigger
data modify storage mineparty:main custom_trigger set value ["execute as @p[tag=will_continue] run function mineparty:game/tiles/diamond/buy/buy with storage mineparty:main diamond.buy","execute as @p[tag=will_continue] run function mineparty:game/tiles/diamond/buy/confirm_cancel","execute as @p[tag=will_continue] run function mineparty:game/tiles/diamond/buy/cancel"]

# Setup data for purchase
data modify storage mineparty:main diamond.buy.UUID set from entity @p[tag=will_continue] UUID
execute store result storage mineparty:main diamond.buy.price int 1 run scoreboard players get #diamond_price mineparty

# Prompt
data modify storage mineparty:main tellraw set value [["Do you want to buy a diamond? This will cost ",{"score":{"name":"#diamond_price","objective":"mineparty"},"color":"gold"}," gold.\n"],["> ",{"click_event":{"action":"run_command","command":"trigger mineparty_custom_trigger set 0"},"color":"green","text":"[Buy]"}],"\n",["> ",{"click_event":{"action":"run_command","command":"trigger mineparty_custom_trigger set 1"},"color":"red","text":"[Pass]"}]]
execute as @s run function mineparty:tellraw with storage mineparty:main