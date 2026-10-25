# Select player pointed at

# Tag self
tag @s add self

# Find player looked at
execute as @a[tag=!self] run function mineparty:settings/host/pointed/check_player

# Cancel function if no player found
execute unless entity @p[tag=pointed] run function mineparty:settings/host/player/menu
execute unless entity @p[tag=pointed] run return 0

# Open dialog for that person
function mineparty:settings/host/player/dialog with entity @p[tag=pointed]

# Clean up
kill @n[tag=player_data]
tag @a remove pointed
tag @s remove self