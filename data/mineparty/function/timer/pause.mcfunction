# Pause/unpause timer

# Cancel if no timer is set
execute unless score timer mineparty matches 1.. run tellraw @s {"color":"red","text":"No timer is running."}
execute unless score timer mineparty matches 1.. run return fail

# If timer was already paused
execute if score #timer_paused mineparty matches 1 run tellraw @s {"color":"gray","text":"Timer unpaused."}
execute if score #timer_paused mineparty matches 1 run function mineparty:timer/continue
execute if score #timer_paused mineparty matches 1 run scoreboard players set #timer_paused mineparty 2

# If timer was not paused
execute if score #timer_paused mineparty matches 0 run tellraw @s {"color":"gray","text":"Timer paused."}
execute if score #timer_paused mineparty matches 0 run schedule clear mineparty:timer/continue
execute if score #timer_paused mineparty matches 0 run scoreboard players set #timer_paused mineparty 1

# Mark as unpaused
execute if score #timer_paused mineparty matches 2 run scoreboard players set #timer_paused mineparty 0