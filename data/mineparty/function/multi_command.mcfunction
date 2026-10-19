# Runs multiple of the same command
# Needs $(command) and $(amount)

$execute unless function $(amount) run return fail

# Reset scoreboard
execute unless score #multi_command_running mineparty matches 1 run scoreboard players set #multi_command_count mineparty 0

# Multi command is now running
scoreboard players set #multi_command_running mineparty 1

# Count up
scoreboard players add #multi_command_count mineparty 1

# Run command
$$(command)

# Run self
$execute unless score #multi_command_count mineparty matches $(amount).. run return run function mineparty:multi_command {amount:$(amount),command:"$(command)"}

# No longer running
scoreboard players set #multi_command_running mineparty 0