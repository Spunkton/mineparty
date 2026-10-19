# Needs $(no_diamond), $(no_warp), $(no_passage), and $(UUID)

$data modify entity @n[type=marker,nbt={UUID:$(UUID)}] Tags set value $(other)
$tag @n[type=marker,nbt={UUID:$(UUID)}] add tile

$execute if function $(no_diamond) run tag @n[type=marker,tag=tile,nbt={UUID:$(UUID)}] add no_diamond
$execute unless function $(no_diamond) run tag @n[type=marker,tag=tile,nbt={UUID:$(UUID)}] remove no_diamond
$execute if function $(no_warp) run tag @n[type=marker,tag=tile,nbt={UUID:$(UUID)}] add no_warp
$execute unless function $(no_warp) run tag @n[type=marker,tag=tile,nbt={UUID:$(UUID)}] remove no_warp
$execute if function $(no_passage) run tag @n[type=marker,tag=tile,nbt={UUID:$(UUID)}] add no_passage
$execute unless function $(no_passage) run tag @n[type=marker,tag=tile,nbt={UUID:$(UUID)}] remove no_passage

# Poof!
$execute at @n[type=marker,tag=tile,nbt={UUID:$(UUID)}] run particle pause_mob_growth ~ ~0.5 ~ 0.5 0 0.5 0 15 normal

# Clean temp
$data remove entity @n[type=marker,nbt={UUID:$(UUID)}] data.temp