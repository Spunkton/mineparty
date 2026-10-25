# Executed as tile where links originate from

# Cancel if not a tile
execute unless entity @s[tag=tile] run tellraw @s {"color":"red","text":"This function should be executed by tiles."}
execute unless entity @s[tag=tile] run return fail

# Remove old tags
tag @e[type=marker,tag=tile] remove pivot
tag @e[type=marker,tag=tile] remove link
tag @e[type=marker,tag=tile] remove link_barrier
tag @e[type=marker,tag=tile] remove link_key
tag @e[type=marker,tag=tile] remove link_super_key
tag @e[type=marker,tag=tile] remove link_toll

# Tag self with pivot
tag @s add pivot

# Store link list length
execute store result score #links mineparty run data get entity @s data.links

# Reset recursion counter
execute store result storage mineparty:temp index int 1 run scoreboard players set #recursion mineparty 0

# Start recursive function looking for links
function mineparty:map/tiles/links/tag_links/recursive

# Clean up
data remove storage mineparty:temp index