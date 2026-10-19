# Needs $(note)

# Cancel if note doesn't exist
$execute unless data storage mineparty:main song[0].notes[$(note)] run return fail

# Set default stereo
$execute unless data storage mineparty:main song[0].notes[$(note)].stereo run data modify storage mineparty:main song[0].notes[$(note)].stereo set value 0

# Set default volume
$execute unless data storage mineparty:main song[0].notes[$(note)].volume run data modify storage mineparty:main song[0].notes[$(note)].volume set value 1