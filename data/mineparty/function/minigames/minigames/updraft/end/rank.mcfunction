# Ranks player (highest is best)

# Tag self
tag @s add self

# Set rank to 1
scoreboard players set @s minigames_rank 1

# Add 1 for every player with a higher score
execute as @a[tag=!not_playing] if score @s minigames > @p[tag=self] minigames run scoreboard players add @p[tag=self] minigames_rank 1

# Remove tag
tag @s remove self