# Titles the data in the actionbar
# Executed as player who selected the tile

tag @s remove pointed_candidate
tag @s remove pointed
tag @s remove tile

execute if data entity @s Tags[] run title @p[tag=self] actionbar ["Tags: ",{"entity":"@s","nbt":"Tags"}]
execute unless data entity @s Tags[] run title @p[tag=self] actionbar "No tags"

tag @s add pointed_candidate
tag @s add pointed
tag @s add tile