# Titles the data in the actionbar
# Executed as player who selected the tile
# Needs $(name), $(type)

$execute if data storage mineparty:main enum.map.tiles.special[{$(type):true}] run title @s actionbar {"color":"green","text":"Edit special settings for tile \"$(name)\""}
$execute unless data storage mineparty:main enum.map.tiles.special[{$(type):true}] run title @s actionbar {"color":"red","text":"\"$(name)\" has no special settings"}