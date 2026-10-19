# Hardcoded title card

# Set to instant appearance instant
title @a times 0 70 20
title @a title ["Mine ","Party"]
execute as @a at @s run playsound minecraft:entity.generic.explode record @s ^ ^ ^1 0.7 2

# Schedule final part
schedule function mineparty:game/start/title_card/go_crazy 30t