# Custom trigger setup
scoreboard players enable @p[tag=host] mineparty_custom_trigger
data modify storage mineparty:main custom_trigger set value ["function mineparty:game/start/introduction/skip","function mineparty:game/start/introduction/listen"]

# Tellraw
data modify storage mineparty:main tellraw set value [{"color":"light_purple","text":"Skip intro?\n"},"> ",{"click_event":{"action":"run_command","command":"trigger mineparty_custom_trigger set 1"},"color":"green","text":"[Listen]"},"\n","> ",{"click_event":{"action":"run_command","command":"trigger mineparty_custom_trigger set 0"},"color":"red","text":"[Skip]"}]
execute as @a[tag=host] run function mineparty:tellraw with storage mineparty:main
tellraw @a[tag=!host] "Host is deciding..."