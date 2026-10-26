# Needs $(map)

# Tags all tiles on the same map
$tag @e[tag=tile,nbt={data:{map:"$(map)"}}] add same_map

# Set a random amount of tiles to be turned
execute store result score #transform_limit mineparty run random value 4..6

# Set fire tick gamerule
execute store result storage mineparty:main gamerule.fire_spread_radius_around_player.value int 1 run gamerule fire_spread_radius_around_player
data modify storage mineparty:main gamerule.fire_spread_radius_around_player.gamerule set value "fire_spread_radius_around_player"
gamerule fire_spread_radius_around_player 0

# Run loop
function mineparty:map/tiles/function/sculk/transform/loop