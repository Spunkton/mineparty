# Executed as player teleporting
# Needs $(UUID) of the player
$execute at @n[tag=tile,nbt={data:{occupied:[{UUID:$(UUID)}]}}] run tp @s ~ ~ ~

# Flair
title @s actionbar "Welcome back!"
execute at @s run particle minecraft:enchant ~ ~0.2 ~ 0.25 0 0.25 2 24
execute at @s run playsound minecraft:entity.ender_eye.death player @s ~ ~ ~ 0.5