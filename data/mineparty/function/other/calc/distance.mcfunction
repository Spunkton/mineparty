# Calculates distance between $(entity_a) and $(entity_b) (as an integer, but it's stored in storage)

$data modify storage mineparty:math distance.pos_a set from entity $(entity_a) Pos
$data modify storage mineparty:math distance.pos_b set from entity $(entity_b) Pos
data modify storage mineparty:math distance.result set compute default float mineparty:distance
return run data get storage mineparty:math distance.result