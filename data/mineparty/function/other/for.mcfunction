# Executes $(command) $(amount) of times

# Scoreboards
### Reset scoreboard if new loop
execute unless score #for_loop_running mineparty matches 1.. run scoreboard players set #for_loop mineparty 0
### For loop is now running
scoreboard players set #for_loop_running mineparty 1
### Add loop count
scoreboard players add #for_loop mineparty 1

# Run command
$$(command)

# Loop if amount hasn't been reached yet
$execute unless score #for_loop mineparty matches $(amount).. run function mineparty:other/for {amount:$(amount),command:"$(command)"}

# Finished
scoreboard players set #for_loop_running mineparty 0