# Executed as latecomer
# Needs $(UUID)

# Add temporary not_playing tag
tag @s add not_playing
tag @s add temp_not_playing

# Remove leftover tags and scores from possible previous games
tag @s remove taking_turn
tag @s remove moving
tag @s remove dice_potion
tag @s remove player
tag @s remove ready
tag @s add rolled_dice
execute as @s run trigger mineparty_custom_trigger set -1
scoreboard players reset @s mineparty_rank

# Clear items and gold
scoreboard players set @s gold 0
clear @s *[custom_data~{dice:true}]
clear @s *[custom_data~{game_item:true}]
clear @s *[custom_data~{rulebook:true}]
clear @s gold_ingot
clear @s diamond

# Clear effects
effect clear @s

# Reset attributes
function mineparty:game/player/reset_attributes

# Spectate host
gamemode spectator @s
tp @s @p[tag=host]

# Notify they're late
tellraw @s "You're late! You get to spectate for now."

# Ask host what to do with you *tsk tsk tsk*
tellraw @p[tag=host] [{"color":"light_purple","text":""},{"selector":"@s"}," is late to the party! What would you like to do with them?\n> (Ignore to leave them as spectator.)"]
$tellraw @p[tag=host] [{"color":"light_purple","text":"> "},{"click_event":{"action":"run_command","command":"execute as @p[nbt={UUID:$(UUID)}] run function mineparty:game/player/join with storage mineparty:main playing_game"},"color":"green","hover_event":{"action":"show_text","value":[{"text":"Makes them fully join the game from the starting tile."}]},"text":"[Join from start]"}," / ",{"click_event":{"action":"run_command","command":"execute as @p[nbt={UUID:$(UUID)}] run function mineparty:game/player/sideline with storage mineparty:main playing_game"},"color":"yellow","hover_event":{"action":"show_text","value":[{"text":"Makes them able to play minigames and earn gold, but doesn't put them on the board."}]},"text":"[Sideline]"}]