# Checks single player if theyre looked at
# Executed as player being checked
# self is the player looking

# Add look check tag
tag @s add look_check

# Add pointed tag if player is looked at
execute if entity @p[tag=self,predicate=mineparty:look_check] run tag @s add pointed

# Remove look check tag
tag @s remove look_check