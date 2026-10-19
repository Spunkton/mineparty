advancement revoke @s only mineparty:settings/host

# Give item back if it's consumed
execute unless entity @s[gamemode=creative] run function mineparty:settings/host/give

# Open host settings
function mineparty:settings/host