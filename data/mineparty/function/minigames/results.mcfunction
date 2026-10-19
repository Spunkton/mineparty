# Shows the results

# Big title
tellraw @a [{"bold":true,"shadow_color":-10747789,"text":""},{"color":"#FFAA00","text":"="},{"color":"#FFAD06","text":"="},{"color":"#FFB00B","text":"="},{"color":"#FFB211","text":"="},{"color":"#FFB517","text":"="},{"color":"#FFB81C","text":"="},{"color":"#FFBB22","text":"="},{"color":"#FFBE28","text":"="},{"color":"#FFC12D","text":"="},{"color":"#FFC333","text":"{"},{"color":"#FFC638","text":"R"},{"color":"#FFC93E","text":"a"},{"color":"#FFCC44","text":"n"},{"color":"#FFCF49","text":"k"},{"color":"#FFD24F","text":"i"},{"color":"#FFD455","text":"n"},{"color":"#FFD75A","text":"g"},{"color":"#FFDA60","text":"s"},{"color":"#FFDD66","text":"}"},{"color":"#FFE06B","text":"="},{"color":"#FFE271","text":"="},{"color":"#FFE577","text":"="},{"color":"#FFE87C","text":"="},{"color":"#FFEB82","text":"="},{"color":"#FFEE87","text":"="},{"color":"#FFF18D","text":"="},{"color":"#FFF393","text":"="},{"color":"#FFF99E","text":"="}]

# Show and sort ranks
function mineparty:multi_command {amount:16,command:"function mineparty:minigames/results/rank"}

# Those who won, tied or lost
execute as @a[tag=!not_playing] if score @s minigames_rank matches 0 run function mineparty:minigames/results/self with entity @s
execute as @a[tag=!not_playing] if score @s minigames_rank matches -1 run function mineparty:minigames/results/self with entity @s
execute as @a[tag=!not_playing] unless score @s minigames_rank matches -1.. run function mineparty:minigames/results/self with entity @s

# Bottom for people who scores *really* badly
execute as @a[tag=!not_playing] if score @s minigames_rank matches 17.. run function mineparty:minigames/results/only_to_self with entity @s

# End with divider
tellraw @a [{"bold":true,"shadow_color":-10747789,"text":""},{"color":"#FFAA00","text":"="},{"color":"#FFAD06","text":"="},{"color":"#FFB00C","text":"="},{"color":"#FFB312","text":"="},{"color":"#FFB617","text":"="},{"color":"#FFB91D","text":"="},{"color":"#FFBC23","text":"="},{"color":"#FFBE29","text":"="},{"color":"#FFC12F","text":"="},{"color":"#FFC435","text":"="},{"color":"#FFC73B","text":"="},{"color":"#FFCA40","text":"="},{"color":"#FFCD46","text":"="},{"color":"#FFD04C","text":"="},{"color":"#FFD352","text":"="},{"color":"#FFD658","text":"="},{"color":"#FFD95E","text":"="},{"color":"#FFDC63","text":"="},{"color":"#FFDF69","text":"="},{"color":"#FFE26F","text":"="},{"color":"#FFE575","text":"="},{"color":"#FFE77B","text":"="},{"color":"#FFEA81","text":"="},{"color":"#FFED87","text":"="},{"color":"#FFF08C","text":"="},{"color":"#FFF392","text":"="},{"color":"#FFF99E","text":"="}]