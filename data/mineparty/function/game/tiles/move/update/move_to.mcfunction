# Adds various move_to tags when the a move update happens

# Clear old tags
tag @e[type=marker,tag=tile] remove move_to
tag @e[type=marker,tag=tile] remove move_to_barrier
tag @e[type=marker,tag=tile] remove move_to_key
tag @e[type=marker,tag=tile] remove move_to_super_key
tag @e[type=marker,tag=tile] remove move_to_toll
tag @e[type=marker,tag=tile] remove move_to_command
tag @e[type=marker,tag=tile] remove special_link
tag @e[type=marker,tag=tile] remove command_link
tag @e[type=marker,tag=tile] remove unlocked

# Tag the links of the new tile
execute as @n[tag=move_update] run function mineparty:map/tiles/links/tag_links

# Add move_to tags
tag @e[type=marker,tag=tile,tag=link,tag=!move_past,tag=!move_update] add move_to
tag @e[type=marker,tag=tile,tag=link_barrier,tag=!move_past,tag=!move_update] add move_to_barrier
tag @e[type=marker,tag=tile,tag=link_key,tag=!move_past,tag=!move_update] add move_to_key
tag @e[type=marker,tag=tile,tag=link_super_key,tag=!move_past,tag=!move_update] add move_to_super_key
tag @e[type=marker,tag=tile,tag=link_toll,tag=!move_past,tag=!move_update] add move_to_toll

# Clear old data
execute as @e[type=marker,tag=move_to] run data remove entity @s data.temp

# Add link type data (amount)
execute as @e[type=marker,tag=tile,tag=special_link] run function mineparty:game/tiles/move/link/type with entity @s
execute as @e[type=marker,tag=tile,tag=command_link] run function mineparty:game/tiles/move/link/command with entity @s

# Clean up
tag @e[type=marker,tag=tile] remove pivot
tag @e[type=marker,tag=tile] remove link
tag @e[type=marker,tag=tile] remove link_barrier
tag @e[type=marker,tag=tile] remove link_key
tag @e[type=marker,tag=tile] remove link_super_key
tag @e[type=marker,tag=tile] remove link_toll
tag @e[type=marker,tag=tile,tag=unlocked] remove special_link