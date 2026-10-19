# @s is player that landed

# Tags self as player selecting the minigame
tag @s add selects_game

# Reorder command queue
data modify storage mineparty:main command_queue set value ["function mineparty:game/minigames/return_to_game","function mineparty:game/round/turn/begin"]

# Set prize money and pick game
execute store result score #minigame_prize mineparty run data get storage mineparty:main playing_game.details.minigame_prize
execute store result score #fail_check mineparty run data get entity @n[tag=tile,tag=landed_on] data.special.battle.tags
execute if score #fail_check mineparty matches 0 run function mineparty:game/minigames/player_pick/tagged
execute unless score #fail_check mineparty matches 0 run function mineparty:game/minigames/player_pick/tagged_custom with entity @n[tag=tile,tag=landed_on] data.special.battle

# Notif
tellraw @a "It's time to battle!"

# Effects
function mineparty:music/play {song:"tiles/battle"}