# Lets (one of) the lowest score player(s) pick the minigame

# Select random lowest score player
tag @a remove lowest_score
scoreboard players operation #lowest mineparty_score > @a[tag=!not_playing] mineparty_score
scoreboard players operation #lowest mineparty_score < @a[tag=!not_playing] mineparty_score
execute as @a if score @s mineparty_score <= #lowest mineparty_score run tag @s add lowest_score
tag @r[tag=lowest_score] add selects_game

# Let player select game
tellraw @p[tag=selects_game] "\u00a7aYou're in last place, so you get to pick!"
execute as @p[tag=selects_game] at @s run function mineparty:game/minigames/player_pick {tags:["comp"]}
tag @a remove selects_game