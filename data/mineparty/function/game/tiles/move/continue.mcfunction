# Don't move when someone else is already moving!

# Tags
tag @a remove moving
tag @p[tag=will_continue] add moving
tag @n[tag=continue_from] add move_from
tag @a remove will_continue
tag @e[tag=tile] remove continue_from
### move_to
execute as @n[tag=move_from] run function mineparty:map/tiles/links/tag_links
tag @e[tag=link,tag=!move_past] add move_to
tag @e[tag=link] remove link

# Move back to tile
execute at @n[tag=move_from] run tp @p[tag=moving] ~ ~ ~
execute at @p[tag=moving] run particle minecraft:enchant ~ ~0.2 ~ 0.25 0 0.25 2 24
execute as @p[tag=moving] at @s run playsound minecraft:entity.ender_eye.death player @s ~ ~ ~ 0.5

# Run loop
function mineparty:game/tiles/move/loop