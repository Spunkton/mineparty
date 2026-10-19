# Loops and waits for the players return

# Loop self
schedule function mineparty:game/player/absentee/wait_for_return 1t replace

# Check if player is there
execute if entity @p[scores={left=1..}] run function mineparty:game/player/absentee/check_for_return with storage mineparty:main turn