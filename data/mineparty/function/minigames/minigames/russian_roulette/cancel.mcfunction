# Ends minigame without winners

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

# Clean up
### Bullet display
kill @e[tag=bullet]
### Tags
tag @a remove taking_shot
tag @a remove dead
### Scoreboard
scoreboard players reset * minigames

# Reset spawn
execute at @n[tag=world_spawn] run spawnpoint @a
execute if data storage mineparty:main playing_game as @a[tag=player] run function mineparty:game/tiles/occupy/set_spawn with entity @s