# Schedule self
schedule function mineparty:minigames/minigames/updraft/tick 1t

# Tag as attacked if attacked
tag @e[type=slime,tag=updraft_hitbox] remove attacked
execute as @e[type=slime,tag=updraft_hitbox] at @s on attacker as @n[distance=...1] run tag @s add attacked

# Show if ready for mace smash
execute as @a[tag=!not_playing] if predicate {type:"minecraft:entity_properties",entity:"this",predicate:{"minecraft:movement":{fall_distance:{min:1.5}}}} run title @s actionbar {"color":"aqua","text":"--== MACE SMASH READY ==--"}
execute as @a[tag=!not_playing] if predicate mineparty:on_ground run title @s actionbar ""

# Slowly move bats downwards (they tend to move up)
execute as @e[tag=updraft_vehicle,type=bat] at @s if block ~ ~-0.03 ~ air run tp @s ~ ~-0.03 ~