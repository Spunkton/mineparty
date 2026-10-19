$tag @n[tag=tile,nbt={data:{occupied:[{UUID:$(UUID)}]}}] add move_from

# Tag links and add move_to tag
execute as @n[tag=move_from] run function mineparty:map/tiles/links/tag_links
tag @e[type=marker,tag=link,tag=!move_past,tag=!pivot] add move_to

# Clean up
tag @e[type=marker,tag=tile] remove pivot
tag @e[type=marker,tag=tile] remove link
tag @e[type=marker,tag=tile] remove link_barrier
tag @e[type=marker,tag=tile] remove link_key
tag @e[type=marker,tag=tile] remove link_super_key
tag @e[type=marker,tag=tile] remove link_toll
tag @e[type=marker,tag=tile,tag=unlocked] remove special_link