# Executed as player buying diamond
data modify entity @n[tag=helper] data.queue set value ["You passed the \u00a7bDiamond Tile\u00a7r!","Would you like to buy a diamond?"]
data modify entity @n[tag=helper] data.command set value "execute as @p[tag=will_continue] run function mineparty:game/tiles/diamond/buy/prompt"
function mineparty:game/helper/dialog/speak