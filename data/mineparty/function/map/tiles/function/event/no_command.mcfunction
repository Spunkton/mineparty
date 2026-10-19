# Runs if no command is found in event tile

# Give host the continue option
execute as @p[tag=host] run function mineparty:game/host/continue/give

# Notify what happened
tellraw @a[tag=host] {"color":"red","text":"No command was found on this event tile. You may continue the game using this Continue."}

return fail