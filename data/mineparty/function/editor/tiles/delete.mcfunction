# Executed as tile

# Particles
particle poof ~ ~ ~ 0.5 0 0.5 0 32 normal

# Sound
playsound minecraft:item.lead.break block @a ~ ~ ~ 1 2

# Remove links
$execute as @e[tag=tile] if data entity @s data.links[{UUID:$(UUID)}] run data remove entity @s data.links[{UUID:$(UUID)}]

# Farewell
kill @n[tag=tile_display,distance=..2]
kill @s[tag=tile]