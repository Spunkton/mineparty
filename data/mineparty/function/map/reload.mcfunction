# Loads all tiles in $(map) from their saved state

# Load tiles
$execute as @e[tag=tile,nbt={data:{map:"$(map)"}}] run function mineparty:map/tiles/load