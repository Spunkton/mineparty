advancement revoke @s only mineparty:map/tiles/inspector

# Summon raycast to find nearest to vision (executed as player inspecting)

# Tag selected tile
function mineparty:editor/tag_selected

# Describe tile
function mineparty:map/tiles/description with entity @n[tag=selected] data

# Particles so you know which one was described
execute at @n[tag=selected] run particle dust{color:[1.000,0.000,0.000],scale:1} ~ ~ ~ 0 0 0 1 0 normal

# Clean up
tag @n[tag=tile,tag=selected] remove selected