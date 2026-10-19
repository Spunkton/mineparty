# Refills with specific tag
# needs $(tags)
$data remove storage mineparty:main minigames.pool[{tags:$(tags)}]
$data modify storage mineparty:main minigames.pool append from storage mineparty:main minigames.available[{tags:$(tags)}]