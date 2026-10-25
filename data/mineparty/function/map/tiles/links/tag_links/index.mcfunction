# Redirects to tagging functions
# Needs $(index)

### Special link tag
$execute if data entity @s data.links[$(index)].type run function mineparty:map/tiles/links/tag_links/special_link with entity @s data.links[$(index)]
### Command link tag
$execute store result score #fail_check mineparty run data get entity @s data.links[$(index)].command
$execute unless score #fail_check mineparty matches 0 run function mineparty:map/tiles/links/tag_links/command_link with entity @s data.links[$(index)]
### Just link tag
$function mineparty:map/tiles/links/tag_links/link with entity @s data.links[$(index)]