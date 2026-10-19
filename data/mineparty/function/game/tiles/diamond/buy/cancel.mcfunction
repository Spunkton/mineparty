# Executed as player buying diamond

# Setup custom trigger
execute as @a run trigger mineparty_custom_trigger set -1

# Prompt
tellraw @s "\u00a7cYou did not buy a diamond."
tellraw @a[tag=!will_continue] [{"color":"red","text":""},{"selector":"@p[tag=will_continue]"}," did not buy a diamond."]
function mineparty:game/tiles/move/continue