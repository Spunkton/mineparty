# Needs $(map)

# Create new data if needed, otherwise just show dialog
$execute unless data storage mineparty:maps maps.$(map) run return run function mineparty:editor/tools/map_editor/create_data {map:"$(map)"}
$function mineparty:editor/tools/map_editor/dialog with storage mineparty:maps maps.$(map)