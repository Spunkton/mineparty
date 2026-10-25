# For my personal use. I use this to make songs from midi files.
# It's a complicated process to get from midi to song here - heck, it might even depend on your DAW whether it works - so please don't ask about it. I will release a tutorial if it's ready.
# https://www.visipiano.com/midi-to-json-converter/

# Input song
function mineparty:music/song_from_midi/input

# Remove empty(?) track
#data remove storage mineparty:main song_from_midi.input.tracks[0]

# Clear output
data modify storage mineparty:main song_from_midi.output set value []
data modify storage mineparty:main song_from_midi.memory set value []

# Reset counter
scoreboard players set #song_from_midi_tick mineparty 0
scoreboard players set #song_from_midi_tick_gap mineparty 0
scoreboard players set #song_from_midi_track mineparty 0
scoreboard players set #song_from_midi_error_out_of_bounds mineparty 0
scoreboard players set #song_from_midi_error_overstack mineparty 0

# Convert to minecraft first
function mineparty:music/song_from_midi/convert_to_minecraft/track

# We cheat a little (does not work unfortunately)
#execute store result storage mineparty:temp max_command_sequence_length int 1 run gamerule max_command_sequence_length
#gamerule max_command_sequence_length 2147483647

# Then order the notes
function mineparty:music/song_from_midi/order