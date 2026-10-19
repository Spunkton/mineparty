# Runs command and replaces command prompt from queue
data remove storage mineparty:main command
data modify storage mineparty:main command set from storage mineparty:main command_queue[0]
data remove storage mineparty:main command_queue[0]
function mineparty:command with storage mineparty:main