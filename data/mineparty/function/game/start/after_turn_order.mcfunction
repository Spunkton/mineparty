# Let the helper speak!
data modify entity @n[tag=helper] data.queue set value ["Then, for the MAIN PRIZE...","Let's summon the first \u00a7bDIAMOND\u00a7r!!!"]
data modify entity @n[tag=helper] data.command set value "function mineparty:game/tiles/diamond with storage mineparty:main playing_game"
function mineparty:game/helper/dialog/speak
schedule function mineparty:game/start/after_diamond 14s