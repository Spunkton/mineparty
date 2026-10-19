# Executed at and as player

# Ugh have to tag @s
tag @s add self

# Get shamed
tellraw @a[tag=!self] ["\u00a7a",{"selector":"@s"},"\u00a7a went all the way up!"]
tellraw @s "\u00a7aYou went all the way up!"

# Clean up
tag @s remove self