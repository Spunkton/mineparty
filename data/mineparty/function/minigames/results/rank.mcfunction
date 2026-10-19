# Meant to be run from multi_command function

execute as @a[tag=!not_playing] if score @s minigames_rank = #multi_command_count mineparty run function mineparty:minigames/results/self with entity @s