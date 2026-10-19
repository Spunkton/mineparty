# Let the helper speak!
data modify entity @n[tag=helper] data.queue set value ["Hello everyone!","I will be your guiding hand through this game of \u00a7oMINE PARTY\u00a7r™!","Would you like to skip the introduction?"]
data modify entity @n[tag=helper] data.command set value "function mineparty:game/start/introduction/prompt_skip_or_listen"
function mineparty:game/helper/dialog/speak