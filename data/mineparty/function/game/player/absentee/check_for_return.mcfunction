# Needs $(UUID)

$execute if entity @p[nbt={UUID:$(UUID)}] run function mineparty:game/player/absentee/returned

scoreboard players reset @a left