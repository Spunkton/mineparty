# Needs $(index)

# Set default stereo
$execute unless data storage mineparty:main song[0].notes[$(index)].stereo run data modify storage mineparty:main song[0].notes[$(index)].stereo set value 0

# Set default volume
$execute unless data storage mineparty:main song[0].notes[$(index)].volume run data modify storage mineparty:main song[0].notes[$(index)].volume set value 1

# Play note
$function mineparty:music/play/note with storage mineparty:main song[0].notes[$(index)]