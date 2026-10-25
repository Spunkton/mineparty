# Adds special tags to link
$tag @n[type=marker,tag=tile,nbt={UUID:$(UUID)}] add self
$tag @n[tag=self] add link_$(type)
tag @n[tag=self] add special_link
$execute if data entity @s data.links[{UUID:$(UUID),unlocked:true}] run tag @n[tag=self] add unlocked
tag @n[tag=self] remove self