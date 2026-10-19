# Remove absentee from game
# Needs $(UUID)

# Fail if they are already here
#$execute if entity @p[nbt={UUID:$(UUID)}] run tellraw @p[tag=host] [{"color":"red","text":""},{"selector":"@p[nbt={UUID:$(UUID)}]"}," is already back."]
#$execute if entity @p[nbt={UUID:$(UUID)}] run return fail

# Stop waiting for them
schedule clear mineparty:game/player/absentee/wait_for_return

$function mineparty:game/player/remove {UUID:$(UUID)}

# End turn
function mineparty:game/round/turn/end