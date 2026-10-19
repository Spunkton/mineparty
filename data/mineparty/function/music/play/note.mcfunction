#Plays for everyone

#For just noteblock inputs
$execute as @a[tag=!no_music] at @s anchored eyes run playsound block.note_block.$(type) record @s ^$(stereo) ^ ^3 $(volume) $(pitch) $(volume)

#For raw inputs
$execute as @a[tag=!no_music] at @s anchored eyes run playsound $(type) record @s ^$(stereo) ^ ^3 $(volume) $(pitch) $(volume)