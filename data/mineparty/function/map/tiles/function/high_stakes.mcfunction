# @s is player that landed

# Tags self as player selecting the minigame
tag @s add selects_game

# Reorder command queue
data modify storage mineparty:main command_queue set value ["function mineparty:game/minigames/return_to_game","function mineparty:game/round/turn/begin"]

# Set prize money and pick game
execute store result score #minigame_prize mineparty run data get storage mineparty:main playing_game.details.minigame_prize 2.5

# Notif
tellraw @a "It's time to battle!"
data modify entity @n[tag=helper] data.queue[] set value ["Grab your wallets, this game will be worth a lot more money!"]
execute unless data entity @n[type=marker,tag=landed_on] data.special.battle.tags run data modify entity @n[tag=helper] data.command set value "function mineparty:game/minigames/player_pick/tagged"
execute if data entity @n[type=marker,tag=landed_on] data.special.battle.tags run data modify entity @n[tag=helper] data.command set value "function mineparty:game/minigames/player_pick/tagged_custom with entity @n[type=marker,tag=landed_on] data.special.battle"
schedule function mineparty:game/helper/dialog/speak 2s

# Effects
function mineparty:music/play {song:"tiles/high_stakes"}