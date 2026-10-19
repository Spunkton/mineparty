#Shows turn order, including whose turn it is.
tellraw @a "\u00a7l========={Turn order}========="
scoreboard players set #announcement_line mineparty 1
data modify storage mineparty:main turn_order_announcement set from storage mineparty:main turn_order

#Announce turn order
function mineparty:game/start/turn_order/announce