# Executed as @a at @s

# Store score
summon marker ~ ~ ~ {Tags:["rank"]}
scoreboard players operation @s mineparty_rank = @s mineparty_score
execute store result entity @n[tag=rank] data.score int 1 run scoreboard players add @s mineparty_rank 1

# Run rank calc
function mineparty:game/scoreboard/rank_calculation with entity @n[tag=rank] data
scoreboard players add @s mineparty_rank 1

# Cleanup
kill @n[tag=rank]