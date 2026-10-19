# Stops everyone from continuing painting

# Stops schedule
schedule clear mineparty:minigames/minigames/pigment_perfect/tick
function mineparty:timer/abort

# Signal
title @a title "Finished!"

# Remove crafting tables
execute at @e[tag=pigment_perfect_crafting_table] run setblock ~ ~ ~ polished_andesite

# Clear dyes
clear @a[tag=!not_playing] #dyes

# Count scores function
schedule function mineparty:minigames/minigames/pigment_perfect/end 2s