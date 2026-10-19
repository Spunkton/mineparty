# Store an item from the pool and remove item
$function mineparty:other/pick_from_list {input:"storage mineparty:maps maps.$(map).shop.temp.pool",output:"entity @s data"}
$data modify entity @s data.map set value "$(map)"
function mineparty:map/tiles/function/shop/summon_villager/remove_from_pool with entity @s data

# Add trade to villager
function mineparty:map/tiles/function/shop/summon_villager/add_trade with entity @s data