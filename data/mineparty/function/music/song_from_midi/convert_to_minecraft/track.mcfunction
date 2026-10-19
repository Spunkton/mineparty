# Remove track
data remove storage mineparty:main song_from_midi.input.tracks[0]

# Check if done
execute unless data storage mineparty:main song_from_midi.input.tracks[0] run tellraw @s {"color":"gray","text":"Conversion complete! Ordering notes..."}
execute unless data storage mineparty:main song_from_midi.input.tracks[0] run return 1

# Reset tick counter
scoreboard players set #song_from_midi_note mineparty 0

# Start note
function mineparty:music/song_from_midi/convert_to_minecraft/note