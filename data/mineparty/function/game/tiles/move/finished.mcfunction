# Set turn phase
data modify storage mineparty:main turn.phase set value 2

# Remove previous landing
tag @e[tag=tile] remove landed_on

# Done moving
execute as @p[tag=moving] at @n[tag=move_from] run function mineparty:game/tiles/occupy

# Tag tile that was landed on
tag @n[tag=move_from] add landed_on

# Sound effects and notifications
execute at @p[tag=moving] run playsound minecraft:block.note_block.chime block @a ~ ~ ~
title @p[tag=moving] actionbar "\u00a76Finished moving!"
tellraw @p[tag=moving] "\u00a76Finished moving!"

# Remove tags
tag @a remove moving
tag @e[tag=tile] remove move_to
tag @e[tag=tile] remove move_from
tag @e[tag=tile] remove move_past
tag @e[tag=tile] remove checkpoint


# Clean up
kill @e[tag=move_to_indicator]
kill @e[tag=special_link_indicator]

# Run ending command
schedule function mineparty:command_queue 2s