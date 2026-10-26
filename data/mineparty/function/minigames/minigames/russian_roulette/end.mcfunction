# Ends minigame

# Stops schedule
schedule clear mineparty:minigames/minigames/russian_roulette/bullet/reload
schedule clear mineparty:minigames/minigames/russian_roulette/bullet/reload/1
schedule clear mineparty:minigames/minigames/russian_roulette/bullet/reload/2
schedule clear mineparty:minigames/minigames/russian_roulette/bullet/reload/3
schedule clear mineparty:minigames/minigames/russian_roulette/bullet/reload/4
schedule clear mineparty:minigames/minigames/russian_roulette/bullet/reload/5
schedule clear mineparty:minigames/minigames/russian_roulette/bullet/roll/loop
schedule clear mineparty:minigames/minigames/russian_roulette/bullet/survive
schedule clear mineparty:minigames/minigames/russian_roulette/next_player
schedule clear mineparty:minigames/minigames/russian_roulette/next_player/after_kill
schedule clear mineparty:minigames/minigames/russian_roulette/end
schedule clear mineparty:minigames/minigames/russian_roulette/alone/notif
function mineparty:timer/cancel

# Rank last living player
scoreboard players set @p[tag=!dead,tag=!not_playing] minigames_rank 1
scoreboard players add @a[tag=!not_playing,tag=dead] minigames_rank 1

# Signal
title @a title "Game over"

# Tell living player the good news
tellraw @p[tag=!dead,tag=!not_playing] {"color":"green","text":"Congratulations, you live."}

# Clean up
### Bullet display
kill @e[tag=bullet]
### Tags
tag @a remove taking_shot
tag @a remove dead
### Scoreboard
scoreboard players reset * minigames

# Put everyone in adventure again
gamemode adventure @a[tag=!not_playing,gamemode=!creative]

# Reset spawn
execute at @n[tag=world_spawn] run spawnpoint @a
execute if data storage mineparty:main playing_game as @a run function mineparty:game/tiles/occupy/set_spawn with entity @s

# Back to main end function
schedule function mineparty:minigames/end 3s