# Needs $(map)
# Executed as tile

# Kill leftovers
kill @e[type=villager,tag=shopkeeper]
kill @e[tag=shop_stall]

# Summon stuff
$function mineparty:map/tiles/function/shop/summon_villager {map:"$(map)"}
function mineparty:map/tiles/function/shop/summon_stall

# Finishing touches
execute as @n[tag=shopkeeper] at @s run rotate @s facing entity @p