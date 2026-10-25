# Plays all notes on the current tick and schedules the next

# Play all notes on current tick
function mineparty:music/play/all_notes

# Schedule self
function mineparty:music/play/schedule_bit with storage mineparty:main song[0]

# Clear note
data remove storage mineparty:main song[0]