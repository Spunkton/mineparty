# Gives everyone their prize foir the minigame

# In case it's just a single minigame
execute unless data storage mineparty:main playing_game run return 0

# Gib money
execute store result storage mineparty:main temp.minigame_prize int 1 run scoreboard players get #minigame_prize mineparty
execute as @a[scores={minigames_rank=0..1}] at @s run function mineparty:game/minigames/prize/recieve with storage mineparty:main temp
execute store result storage mineparty:main temp.minigame_prize int 0.5 run scoreboard players get #minigame_prize mineparty
execute as @a[scores={minigames_rank=2}] at @s run function mineparty:game/minigames/prize/recieve with storage mineparty:main temp
execute as @a[scores={minigames_rank=-1}] at @s run function mineparty:game/minigames/prize/recieve with storage mineparty:main temp
execute store result storage mineparty:main temp.minigame_prize int 0.3 run scoreboard players get #minigame_prize mineparty
execute as @a[scores={minigames_rank=3}] at @s run function mineparty:game/minigames/prize/recieve with storage mineparty:main temp

# HAHAHA LOSERSSS
execute as @a unless score @s minigame_rank matches -1..3 at @s run tellraw @s "\u00a7cYou did not gain any gold..."