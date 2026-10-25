# Summon raycast to find nearest to vision (executed as player editing)

# Summon raycast
execute anchored eyes run function mineparty:other/raycast/medium {length:64}

# Select closest tile
execute at @n[tag=ray] run tag @n[tag=tile,distance=..3] add selected

# Clean up
kill @n[tag=ray]