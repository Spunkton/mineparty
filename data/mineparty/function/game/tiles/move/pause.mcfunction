# Cancel schedule
schedule clear mineparty:game/tiles/move/loop

# Tag person who was moving
tag @p[tag=moving] add will_continue

# Tag tile player was on
execute unless entity @n[tag=move_update] run tag @n[tag=move_from] add continue_from
tag @n[tag=move_update] add continue_from

# Remove tags
tag @e[tag=tile] remove move_to
tag @e[tag=tile] remove move_from
tag @e[tag=tile] remove move_update
tag @e[tag=tile] remove landed_on
tag @a remove moving

# Remove indicators
kill @e[tag=move_to_indicator]
kill @e[tag=special_link_indicator]

# Occupy the current tile (checkpoint)
execute as @p[tag=will_continue] at @n[tag=continue_from] run function mineparty:game/tiles/occupy/silent
scoreboard players operation #initial_steps mineparty = #steps mineparty