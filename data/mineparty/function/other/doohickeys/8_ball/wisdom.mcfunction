# Executed as and at player
advancement revoke @s only mineparty:other/doohickeys/8_ball

# Get a random wisdom
function mineparty:other/pick_from_list {input:"storage mineparty:main quips.doohickeys.8_ball",output:"storage mineparty:main temp.quip"}

# Give item back (consumed)
execute unless entity @s[gamemode=creative] run function mineparty:other/doohickeys/8_ball/get

# Speak!
title @s subtitle {"storage":"mineparty:main","interpret":true,"nbt":"temp.quip"}
title @s title {"player":{"properties":[{"name":"textures","value":"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvZGYyNDEyZDYzZGQyZTBlMjMyMjMwYWJkMDRhOGY3MjZlNTFjOTNhNzI2ODZjN2RhZTE3MjJjNDY3N2Y5ZjU0OCJ9fX0="}]},"shadow_color":1}