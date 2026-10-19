# Checks whether the scoreboard status has changed (to prevent scoreboard flicker)

# Score gold/diamonds
execute as @a[tag=!not_playing] store result score @s gold run clear @s gold_ingot 0
execute as @a[tag=!not_playing] store result score @s diamond run clear @s diamond 0

# Add all scores to a single number
scoreboard players set #scoreboard_checksum mineparty 0
scoreboard players operation #scoreboard_checksum mineparty += @a[tag=player] gold
scoreboard players operation #scoreboard_checksum mineparty += @a[tag=player] diamond
scoreboard players operation #scoreboard_checksum mineparty += round mineparty

# Compare with old checksum
execute unless score #scoreboard_checksum mineparty = #old_scoreboard_checksum mineparty run function mineparty:game/scoreboard/update

# Set old checksum
scoreboard players operation #old_scoreboard_checksum mineparty = #scoreboard_checksum mineparty