# Needs $(type)

$execute if data storage mineparty:main enum.map.tiles.special[{$(type):true}] run return 1
$execute unless data storage mineparty:main enum.map.tiles.special[{$(type):true}] run return fail