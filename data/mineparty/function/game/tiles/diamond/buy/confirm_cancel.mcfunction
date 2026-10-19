# Executed as player buying diamond

# Setup custom trigger
execute as @a run trigger mineparty_custom_trigger set -1
scoreboard players enable @s mineparty_custom_trigger

# Prompt
tellraw @s "<Helper> Are you sure you don't want to buy a diamond? This is a \u00a7bDIAMOND\u00a7r we are talking about, you know, the thing you need to win the game."
tellraw @s ["> ","\u00a7a[",{"click_event":{"action":"run_command","command":"trigger mineparty_custom_trigger set 0"},"color":"green","text":"Buy"},"\u00a7a] \u00a7r/ \u00a7c[",{"click_event":{"action":"run_command","command":"trigger mineparty_custom_trigger set 2"},"color":"red","text":"Pass!"},"\u00a7c]"]