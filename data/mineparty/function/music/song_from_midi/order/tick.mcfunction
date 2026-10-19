# Stores notes from $(tick) into output, and stores the $(tick_gap) into the previous notes

# Tick gap up
scoreboard players add #song_from_midi_tick_gap mineparty 1

# Just tick up if there are no notes on this tick
$execute unless data storage mineparty:main song_from_midi.memory[{tick:$(tick)}] run return run scoreboard players add #song_from_midi_tick mineparty 1

# Add new item to memory
data modify storage mineparty:main song_from_midi.output append value {notes:[],tick:1}

# Store notes from tick into output
$data modify storage mineparty:main song_from_midi.output[-1].notes append from storage mineparty:main song_from_midi.memory[{tick:$(tick)}]
### Error check
execute store result score #fail_check mineparty run data get storage mineparty:main song_from_midi.output[-1].notes
$execute if score #fail_check mineparty matches 17.. run scoreboard players set #song_from_midi_error_overstack mineparty $(tick)

# Store tick gap into previous output
$data modify storage mineparty:main song_from_midi.output[-2].tick set value $(tick_gap)

# Delete current tick
$data remove storage mineparty:main song_from_midi.memory[{tick:$(tick)}]

# Tick up and reset tick gap
scoreboard players add #song_from_midi_tick mineparty 1
scoreboard players set #song_from_midi_tick_gap mineparty 1