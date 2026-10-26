# Needs $(amount)

# Give gold
$give @s gold_ingot $(amount)

# Prepare for storing
data modify storage mineparty:temp store.UUID set from entity @s UUID
$data modify storage mineparty:temp store.amount set value $(amount)

# Store into stats
function mineparty:game/items/gold/store with storage mineparty:temp store

# Clean up
data remove storage mineparty:temp store