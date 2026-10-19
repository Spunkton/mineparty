advancement revoke @s only mineparty:game/continue

# If no queue
execute unless data storage mineparty:main command_queue[] run tellraw @s "\u00a7cNo commands queued"

# Continue from queue
function mineparty:command_queue