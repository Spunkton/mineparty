# Schedule self
schedule function mineparty:minigames/wait_for_ready 1t

# Enable trigger
scoreboard players enable @a[tag=!not_playing] ready

# Count players and ready players
scoreboard players set #minigame_player_count mineparty 0
execute as @a[tag=!not_playing] run scoreboard players add #minigame_player_count mineparty 1
scoreboard players set #ready_player_count mineparty 0
execute as @a[tag=!not_playing,scores={ready=1..}] run scoreboard players add #ready_player_count mineparty 1

# Execute if everyone is ready
execute if score #ready_player_count mineparty >= #minigame_player_count mineparty run tellraw @a "Everybody is ready! Starting game..."
execute if score #ready_player_count mineparty >= #minigame_player_count mineparty run schedule clear mineparty:minigames/wait_for_ready
execute if score #ready_player_count mineparty >= #minigame_player_count mineparty as @a run trigger ready set 1
execute if score #ready_player_count mineparty >= #minigame_player_count mineparty run function mineparty:timer/start with storage mineparty:main ready

# Show if ready or not
execute as @a[scores={ready=1..}] run title @s actionbar ["",{"color":"green","text":"You are ready!"}," (",{"score":{"name":"#ready_player_count","objective":"mineparty"}},"/",{"score":{"name":"#minigame_player_count","objective":"mineparty"}}," ready)"]
execute as @a[scores={ready=..0}] run title @s actionbar ["",{"color":"red","text":"You are not ready."}," (",{"score":{"name":"#ready_player_count","objective":"mineparty"}},"/",{"score":{"name":"#minigame_player_count","objective":"mineparty"}}," ready)"]
