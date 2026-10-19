# Let the helper speak!
data modify entity @n[tag=helper] data.queue set value ["Beautiful... I still remember eating my first diamond...","But enough dillydallying! Let's begin! Starting with..."]
data modify entity @n[tag=helper] data.command set value "function mineparty:game/round/turn/begin"
function mineparty:game/helper/dialog/speak