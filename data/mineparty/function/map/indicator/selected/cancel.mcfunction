kill @e[type=marker,tag=ray]
tag @s remove self
tag @e[type=marker,tag=tile] remove pointed_candidate
return fail