# Saves tile data, so modifications can be made during the game and be reverted
# Things not saved:
# - Anything not under "data" in the entity NBT
# - Blocks! Blocks aren't saved, so don't change them!!
# - Tags

# Executed as tile being saved

# Clear old save
data remove entity @s data.save

# Save data
data modify entity @s data.save set from entity @s data