# Executed at and as player

# Get shamed
tellraw @a[distance=.1..] ["\u00a7a",{"selector":"@s"},"\u00a7a fell off!"]
tellraw @s "\u00a7cYou fell off!"

# Tag self
tag @s add lost

# Go spectator
gamemode spectator @s
spectate @p[tag=!lost,tag=!not_playing]

# Rank self
scoreboard players add @a[scores={minigames_rank=1..}] minigames_rank 1
scoreboard players set @s minigames_rank 1

# Check if everyone fell off already
execute unless entity @p[tag=!lost,tag=!not_playing] run function mineparty:minigames/minigames/no_way_but_up/end