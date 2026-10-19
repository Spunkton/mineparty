# Redirects to tagging functions
# Needs $(index)

### Special link tag
$execute if data entity @s data.links[$(index)].type run function mineparty:map/tiles/links/tag_links/special_link with entity @s data.links[$(index)]
### Just link tag
$function mineparty:map/tiles/links/tag_links/link with entity @s data.links[$(index)]