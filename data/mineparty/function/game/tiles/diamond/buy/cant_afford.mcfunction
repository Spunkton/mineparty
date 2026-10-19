# Executed as player buying diamond
data modify entity @n[tag=helper] data.queue set value ["You passed the \u00a7bDiamond Tile\u00a7r!","Wait...","You can't afford to buy a diamond! Yeeouch..."]
data modify entity @n[tag=helper] data.command set value "function mineparty:game/tiles/move/continue"
function mineparty:game/helper/dialog/speak