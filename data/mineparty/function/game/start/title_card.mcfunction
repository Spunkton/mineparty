# Hardcoded title card

# Set to instant appearance instant
title @a times 0 100 20
title @a title ["Mine ","       "]
execute as @a at @s run playsound minecraft:entity.generic.explode record @s ^ ^ ^1 0.7 2

# Schedule second part
schedule function mineparty:game/start/title_card/second_half 30t