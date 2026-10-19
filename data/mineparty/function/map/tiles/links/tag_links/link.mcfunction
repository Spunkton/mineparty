# Adds tag to link
$tag @n[type=marker,tag=tile,nbt={UUID:$(UUID)}] add link
$execute unless entity @n[type=marker,tag=tile,nbt={UUID:$(UUID)}] run data remove entity @s data.links[{UUID:$(UUID)}]