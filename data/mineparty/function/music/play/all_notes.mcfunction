# Plays all the notes on the current tick

# Store note count
execute store result score #notes mineparty run data get storage mineparty:main song[0].notes

# Reset recursion counter
execute store result storage mineparty:temp index int 1 run scoreboard players set #recursion mineparty 0

# Start recursive function playing notes
function mineparty:music/play/recursive

# Clean up
data remove storage mineparty:temp index