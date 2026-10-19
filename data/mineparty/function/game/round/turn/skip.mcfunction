# Skips current turn

# Notify host
tellraw @a[tag=host] {"color":"gray","text":"Turn skipped..."}

# Stop whatever is happening
schedule clear mineparty:game/dice/wait_for_roll
function mineparty:game/tiles/move/cancel

# End turn
function mineparty:game/round/turn/end