#Custom trigger setup
scoreboard players enable @p[tag=host] mineparty_custom_trigger
data modify storage mineparty:main custom_trigger set value ["function mineparty:game/start/introduction/skip","function mineparty:game/start/introduction/listen"]

#Tellraw
tellraw @p[tag=host] ["\u00a7d> \u00a7a",{"click_event":{"action":"run_command","command":"trigger mineparty_custom_trigger set 1"},"color":"green","text":"[Listen]"},"\u00a7d / \u00a7c",{"click_event":{"action":"run_command","command":"trigger mineparty_custom_trigger set 0"},"color":"red","text":"[Skip]"}]
tellraw @a[tag=!host] "Host is deciding..."