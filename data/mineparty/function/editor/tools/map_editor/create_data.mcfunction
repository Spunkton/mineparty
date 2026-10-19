# Needs $(map)

# Create temporary map data
$data modify storage mineparty:maps temp.maps.$(map) set value {id:"$(map)",name:"$(map)",diamond_price:20,minigame_prize:10}

# Open dialog
$function mineparty:editor/tools/map_editor/dialog with storage mineparty:maps temp.maps.$(map)