# Stores converted notes into an actually playable track

# Store scores
execute store result storage mineparty:main song_from_midi.tick.tick int 1 run scoreboard players get #song_from_midi_tick mineparty
execute store result storage mineparty:main song_from_midi.tick.tick_gap int 1 run scoreboard players get #song_from_midi_tick_gap mineparty

# Check current tick
function mineparty:music/song_from_midi/order/tick with storage mineparty:main song_from_midi.tick

# Run self
execute if data storage mineparty:main song_from_midi.memory[] run return run function mineparty:music/song_from_midi/order

# Reset gamerule
function mineparty:music/song_from_midi/reset_gamerule with storage mineparty:temp

# Clean up
#data remove storage mineparty:temp max_command_sequence_length

# Notify
tellraw @s {"color":"gray","text":"Ordering complete!"}
execute if score #song_from_midi_error_out_of_bounds mineparty matches 1 run tellraw @s {"color":"red","text":"Song contains illegal pitches!"}
#execute if score #song_from_midi_error_overstack mineparty matches 1.. run tellraw @s [{"color":"red","text":"Song has too many notes at once! (Tick: "},{"score":{"objective":"mineparty","name":"#song_from_midi_error_overstack"}},")."]
function mineparty:music/song_from_midi/order/notif with storage mineparty:main song_from_midi