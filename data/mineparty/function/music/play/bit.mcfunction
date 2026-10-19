# Can play 8 bits max

# Set defaults
function mineparty:music/play/set_default {note:0}
function mineparty:music/play/set_default {note:1}
function mineparty:music/play/set_default {note:2}
function mineparty:music/play/set_default {note:3}
function mineparty:music/play/set_default {note:4}
function mineparty:music/play/set_default {note:5}
function mineparty:music/play/set_default {note:6}
function mineparty:music/play/set_default {note:7}
function mineparty:music/play/set_default {note:8}
function mineparty:music/play/set_default {note:9}
function mineparty:music/play/set_default {note:10}
function mineparty:music/play/set_default {note:11}
function mineparty:music/play/set_default {note:12}
function mineparty:music/play/set_default {note:13}
function mineparty:music/play/set_default {note:14}
function mineparty:music/play/set_default {note:15}

# Play notes
function mineparty:music/play/note with storage mineparty:main song[0].notes[0]
function mineparty:music/play/note with storage mineparty:main song[0].notes[1]
function mineparty:music/play/note with storage mineparty:main song[0].notes[2]
function mineparty:music/play/note with storage mineparty:main song[0].notes[3]
function mineparty:music/play/note with storage mineparty:main song[0].notes[4]
function mineparty:music/play/note with storage mineparty:main song[0].notes[5]
function mineparty:music/play/note with storage mineparty:main song[0].notes[6]
function mineparty:music/play/note with storage mineparty:main song[0].notes[7]
function mineparty:music/play/note with storage mineparty:main song[0].notes[8]
function mineparty:music/play/note with storage mineparty:main song[0].notes[9]
function mineparty:music/play/note with storage mineparty:main song[0].notes[10]
function mineparty:music/play/note with storage mineparty:main song[0].notes[11]
function mineparty:music/play/note with storage mineparty:main song[0].notes[12]
function mineparty:music/play/note with storage mineparty:main song[0].notes[13]
function mineparty:music/play/note with storage mineparty:main song[0].notes[14]
function mineparty:music/play/note with storage mineparty:main song[0].notes[15]

# Schedule self
function mineparty:music/play/schedule_bit with storage mineparty:main song[0]

# Clear note
data remove storage mineparty:main song[0]