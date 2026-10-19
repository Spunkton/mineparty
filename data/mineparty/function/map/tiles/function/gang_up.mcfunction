# @s is player that landed

# Tags self as player selecting the minigame
tag @s add selects_game

# Reorder command queue
data modify storage mineparty:main command_queue set value ["function mineparty:game/minigames/return_to_game","function mineparty:game/round/turn/begin"]

# Set prize money and pick game
execute store result score #minigame_prize mineparty run data get storage mineparty:main playing_game.details.minigame_prize
function mineparty:game/minigames/player_pick/tagged_custom {tags:["1vall"]}

# Notif
tellraw @a ["It's time to gang up on ",{"selector":"@s"},"!"]

# Effects
function mineparty:music/play {song:"tiles/gang_up"}