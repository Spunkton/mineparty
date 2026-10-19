# This is all effects

effect give @a minecraft:darkness 10 0 true
function mineparty:music/play {song:"minigame"}
scoreboard players set #minigame_title mineparty 90

# Funny subtitle
function mineparty:other/pick_from_list {input:"storage mineparty:main quips.minigames.subtitle",output:"storage mineparty:main minigame.subtitle"}

# Start title loop
title @a times 0 30 30
function mineparty:game/minigames/title/loop
