#Let the helper speak!
data modify entity @n[tag=helper] data.queue set value ["Seems like you know your way around!","In that case, it's time to play..."]
data modify entity @n[tag=helper] data.command set value "function mineparty:game/start/title_card"
function mineparty:game/helper/dialog/speak