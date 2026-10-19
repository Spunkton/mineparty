# Run absentee function if player is absent
$execute unless entity @p[nbt={UUID:$(UUID)}] run function mineparty:game/player/absentee {UUID:$(UUID)}
$execute unless entity @p[nbt={UUID:$(UUID)}] run return fail

# Rotate turn
$tag @p[nbt={UUID:$(UUID)}] add taking_turn

# Sound effect
execute as @p[tag=taking_turn] at @s run playsound minecraft:block.note_block.harp player @s ~ ~ ~ 1 1

return 1