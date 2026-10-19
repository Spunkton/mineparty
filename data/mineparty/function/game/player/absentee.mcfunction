# Executed if player is absent
# Needs $(UUID)

# Notify
execute as @p[tag=host] at @s run playsound minecraft:block.note_block.bell player @s ~ ~ ~ 1 0.5 1
tellraw @a[tag=!host] [{"color":"red","text":"Someone left the party early! Waiting..."}]
tellraw @p[tag=host] [{"color":"light_purple","text":"Someone left the party early! Would you like to act on them?\n> (Ignore to wait until they come back.)"}]
$tellraw @p[tag=host] [{"color":"light_purple","text":"> "},{"click_event":{"action":"run_command","command":"function mineparty:game/player/absentee/skip {UUID:$(UUID)}"},"color":"yellow","hover_event":{"action":"show_text","value":[{"text":"Skips their turn."}]},"text":"[Skip turn]"}," / ",{"click_event":{"action":"run_command","command":"function mineparty:game/player/absentee/remove {UUID:$(UUID)}"},"color":"red","hover_event":{"action":"show_text","value":[{"text":"Completely removes them from the game."}]},"text":"[Remove]"}]

# If player was moving
execute store result score #turn_phase mineparty run data get storage mineparty:main turn.phase
execute if score #turn_phase mineparty matches 1 run function mineparty:game/tiles/move/cancel

# Start waiting
function mineparty:game/player/absentee/wait_for_return