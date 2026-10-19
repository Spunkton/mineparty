# Makes helper follow whoever is taking their turn

# Set home position to player
data modify entity @n[tag=helper] home_pos set from entity @p[tag=taking_turn] Pos

# Apparently you can force love
execute if data storage mineparty:main playing_game run data modify entity @n[tag=helper] Brain.memories."minecraft:liked_player".value set from entity @p[tag=taking_turn] UUID

# Schedule self
schedule function mineparty:game/helper/follow 3s