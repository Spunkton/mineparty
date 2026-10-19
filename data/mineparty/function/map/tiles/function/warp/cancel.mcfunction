# Cancel loop
schedule clear mineparty:map/tiles/function/warp/loop

# Dismount
ride @p[tag=taking_turn] dismount

# Clean up
tag @p[tag=taking_turn] remove input_left
tag @p[tag=taking_turn] remove input_right
tp @n[tag=warp_display] 0 -100 0
kill @e[tag=warp_vehicle]
kill @e[tag=warp_indicator]
scoreboard players reset * minigames