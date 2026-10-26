# Ends game without winner

# Clear schedules
schedule clear mineparty:command_queue
schedule clear mineparty:game/dice/wait_for_roll
schedule clear mineparty:game/start/introduction
schedule clear mineparty:game/helper/dialog/line
schedule clear mineparty:game/start/title_card/go_crazy
schedule clear mineparty:game/start/title_card/second_half
schedule clear mineparty:game/minigames/title/loop
schedule clear mineparty:game/round/turn/begin
schedule clear mineparty:game/scoreboard/update
schedule clear mineparty:game/helper/follow
schedule clear mineparty:map/tiles/function/sculk/transform/loop
schedule clear mineparty:minigames/wait_for_ready
schedule clear mineparty:music/play/bit
function mineparty:game/tiles/move/cancel
function mineparty:map/tiles/function/warp/cancel
function mineparty:minigames/cancel
function mineparty:timer/cancel

# Clear queues
data remove entity @n[tag=helper] data.queue
data remove entity @n[tag=helper] data.command
data remove storage mineparty:main command_queue

# Clear titles
title @a reset

# Reset scores
scoreboard players reset * gold
scoreboard players reset * diamond
scoreboard players reset * mineparty_score
scoreboard objectives setdisplay sidebar
execute as @a run trigger mineparty_custom_trigger set -1


# Free the helper
data remove entity @n[tag=helper] Brain.memories."minecraft:liked_player".value

# Reset tiles
kill @e[tag=tile_decal]
tag @e[type=marker,tag=tile] remove diamond
tag @e[type=marker,tag=tile] remove transformed
tag @e[type=marker,tag=tile] remove same_map
tag @e[type=marker,tag=tile] add update
execute as @e[type=marker,tag=tile] run data remove entity @s data.modifiers
execute as @e[type=marker,tag=tile] run data remove entity @s data.temp
execute as @e[type=marker,tag=tile] run data remove entity @s data.links[].unlocked
execute as @e[type=marker,tag=tile] run data modify entity @s data.occupied set value []
execute if entity @n[tag=shopkeeper] run function mineparty:map/tiles/function/shop/remove_all
function mineparty:map/reload with storage mineparty:main playing_game

# Reset spawn
execute at @n[tag=world_spawn] run spawnpoint @a

# Remove tags
tag @a remove player
tag @a remove dice_potion
tag @a[tag=temp_not_playing] remove not_playing
tag @a remove temp_not_playing

# Clear effects
effect clear @a glowing

# No longer gaming
data remove storage mineparty:main playing_game

# Tellraw 
tellraw @a[tag=host] "\u00a7cGame cancelled."