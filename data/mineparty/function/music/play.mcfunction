# Plays songs!
# Executed as listener
# Needs $(song)

# Reset data
data modify storage mineparty:main song set value []

# Load song
$function mineparty:music/songs/$(song)

# Start loop
function mineparty:music/play/bit