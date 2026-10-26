# Needs $(other), $(tags), and $(UUID)

# 
$data modify storage mineparty:temp tags set value [$(other)]
$data merge entity @n[type=marker,nbt={UUID:$(UUID)}] {Tags:$(tags)}
$data modify entity @n[type=marker,nbt={UUID:$(UUID)}] Tags append string storage mineparty:temp tags[]
$data modify entity @n[type=marker,nbt={UUID:$(UUID)}] Tags append string storage mineparty:temp tags[][]

# Readd tile tag
$tag @n[type=marker,nbt={UUID:$(UUID)}] add tile

# Poof!
$execute at @n[type=marker,tag=tile,nbt={UUID:$(UUID)}] run particle pause_mob_growth ~ ~0.5 ~ 0.5 0 0.5 0 15 normal

# Clean up
data remove storage mineparty:temp tags