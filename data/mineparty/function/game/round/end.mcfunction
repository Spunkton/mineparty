# End of round

# Check if it is final round of the game
execute if score round mineparty = max_rounds mineparty run function mineparty:game/end
execute if score round mineparty = max_rounds mineparty run return 1

# Maybe shenanigans


# Store command queue to play minigame and return
### Prize money
execute store result score #minigame_prize mineparty run data get storage mineparty:main playing_game.details.minigame_prize
### Pick game
data modify storage mineparty:main command_queue set value ["function mineparty:game/minigames/player_pick/lowest_score","function mineparty:game/minigames/return_to_game","function mineparty:game/round/turn/begin"]
# Make helper say stuff for funzies
data modify entity @n[tag=helper] data.command set value "function mineparty:game/minigames/title"
data modify entity @n[tag=helper] data.queue[] prepend value ""
function mineparty:other/pick_from_list {input:"storage mineparty:main quips.helper.end_of_round",output:"entity @n[tag=helper] data.queue[0]"}
function mineparty:game/helper/dialog/speak
schedule function mineparty:command_queue 5s