# Teleports everyone back and summons new ball

# Teleport to start
tp @a[team=Blue] @n[tag=sulfurball_start_blue]
tp @a[team=Pink] @n[tag=sulfurball_start_pink]
execute as @a[team=Blue] at @s facing entity @n[tag=sulfurball_start_pink] eyes run tp @s ~ ~ ~ ~ ~
execute as @a[team=Pink] at @s facing entity @n[tag=sulfurball_start_blue] eyes run tp @s ~ ~ ~ ~ ~

# Summon ball
function mineparty:minigames/minigames/sulfurball/summon