# Stores note into storage, into an intermediary format
# Input: Velocity - Time - Midi - Name
# Output: Volume - Tick - Pitch - Instrument (type)

# Add new item to memory
data modify storage mineparty:main song_from_midi.memory prepend value {volume:1,type:"harp",tick:1,pitch:1.0}

# Velocity to volume
data modify storage mineparty:main song_from_midi.memory[0].volume set from storage mineparty:main song_from_midi.input.tracks[0].notes[0].velocity

# Name to type
data modify storage mineparty:main song_from_midi.memory[0].type set from storage mineparty:main song_from_midi.input.tracks[0].name

# Time to tick
data modify storage mineparty:main song_from_midi.memory[0].tick set compute default integer {type:"minecraft:from_float",input:{type:"minecraft:mul",inputs:[20,{type:"minecraft:add",inputs:[0.01,{type:"minecraft:storage",storage:"mineparty:main",path:"song_from_midi.input.tracks[0].notes[0].time"}]}]}}

# Midi to pitch
### Error check
execute store result score #fail_check mineparty run data get storage mineparty:main song_from_midi.input.tracks[0].notes[0].midi
execute unless score #fail_check mineparty matches 54..78 run scoreboard players set #song_from_midi_error_out_of_bounds mineparty 1
### Convert
data modify storage mineparty:main song_from_midi.memory[0].pitch set compute default float {type:"minecraft:mul",inputs:[0.5,{type:"minecraft:pow",base:2,exponent:{type:"minecraft:div",left:{type:"minecraft:sub",left:{type:"minecraft:storage",storage:"mineparty:main",path:"song_from_midi.input.tracks[0].notes[0].midi"},right:54},right:12}}]}

# Remove note
data remove storage mineparty:main song_from_midi.input.tracks[0].notes[0]

# Check if there is a note left, otherwise, loop back
execute if data storage mineparty:main song_from_midi.input.tracks[0].notes[0] run scoreboard players add #song_from_midi_note mineparty 1
execute if data storage mineparty:main song_from_midi.input.tracks[0].notes[0] run return run function mineparty:music/song_from_midi/convert_to_minecraft/note
# Otherwise, return to track function
execute unless data storage mineparty:main song_from_midi.input.tracks[0].notes[0] run scoreboard players add #song_from_midi_track mineparty 1
execute unless data storage mineparty:main song_from_midi.input.tracks[0].notes[0] run tellraw @s [{"color":"gray","text":"Track "},{"score":{"objective":"mineparty","name":"#song_from_midi_track"}}," converted. (Name: ",{"storage":"mineparty:main","nbt":"song_from_midi.input.tracks[0].name"},", Notes: ",{"score":{"objective":"mineparty","name":"#song_from_midi_note"}},")"]
execute unless data storage mineparty:main song_from_midi.input.tracks[0].notes[0] run return run function mineparty:music/song_from_midi/convert_to_minecraft/track