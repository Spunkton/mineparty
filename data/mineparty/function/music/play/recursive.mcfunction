# Tag link with index
function mineparty:music/play/index with storage mineparty:temp

# Tick up
execute store result storage mineparty:temp index int 1 run scoreboard players add #recursion mineparty 1

# Repeat if list is not done yet
execute unless score #recursion mineparty > #notes mineparty run return run function mineparty:music/play/recursive