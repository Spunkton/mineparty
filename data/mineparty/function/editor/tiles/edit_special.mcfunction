# Needs $(UUID), $(location) and $(value)

# Edit data
$data modify entity @n[type=marker,tag=tile,nbt={UUID:$(UUID)}] $(location) set value $(value)

# Poof!
$execute at @n[type=marker,tag=tile,nbt={UUID:$(UUID)}] run particle composter ~ ~0.5 ~ 0.5 0 0.5 0 15 normal
playsound minecraft:entity.experience_orb.pickup player @s ~ ~ ~ 0.2 1