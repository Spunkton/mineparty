# Makes latecomer play minigames, without putting them on the playing board or scoreboard.
# Executed as latecomer

# Fail if they are already here
$execute if entity @p[nbt={UUID:$(UUID)}] run tellraw @p[tag=host] [{"color":"red","text":""},{"selector":"@p[nbt={UUID:$(UUID)}]"}," is already back."]
$execute if entity @p[nbt={UUID:$(UUID)}] run return fail

# Stop waiting for them
schedule clear mineparty:game/player/absentee/wait_for_return

# End turn
function mineparty:game/round/turn/end