# Executed as an alr blacklisted tile

# Blacklist neighbours
function mineparty:map/tiles/links/tag_links
tag @e[tag=link] add blacklist
tag @e[tag=link] remove link

# Don't have to blacklist self again
tag @s add blacklist_old