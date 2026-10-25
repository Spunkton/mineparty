# Shows particles above player that is looked at

# Tag self
tag @s add self

# Find player looked at
execute as @a[tag=!self] run function mineparty:settings/host/pointed/check_player

# Particles so you know who is pointed at
execute at @p[tag=pointed] run particle dust{color:[1.000,0.000,0.000],scale:1} ~ ~3 ~ 0 0 0 1 0 normal @s

# Clean up
tag @a remove pointed
tag @s remove self