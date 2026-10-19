# Redirect to description function with name
# Needs $(name) and $(type)
$execute as @p[tag=self] run function mineparty:map/tiles/description/$(type) {name:"$(name)"}