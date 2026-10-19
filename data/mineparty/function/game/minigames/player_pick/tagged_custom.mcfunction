# Let player select game
# Needs $(tags)
tellraw @p[tag=selects_game] "\u00a7aYou get to pick the minigame!"
$execute as @p[tag=selects_game] at @s run function mineparty:game/minigames/player_pick {tags:$(tags)}
tag @a remove selects_game