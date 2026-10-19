# Just plays the output

# Reset data
data modify storage mineparty:main song set value []

# Load song
data modify storage mineparty:main song set from storage mineparty:main song_from_midi.output

# Start loop
function mineparty:music/play/bit