# Summons ray and stops if it hits a block or until the max range is counted

# Summon ray
summon marker ^ ^ ^0.5 {Tags:["ray"]}

# Tick up
scoreboard players add #raycast_length mineparty 1

# Loop if not in block or not at max range
execute unless score #raycast_length mineparty >= #max_raycast_length mineparty positioned ^ ^ ^0.5 if block ~ ~ ~ #air run return run function mineparty:other/raycast/medium/step

# Tag self if inside block
execute positioned ^ ^ ^0.5 unless block ~ ~ ~ #air run tag @n[tag=ray] add in_block