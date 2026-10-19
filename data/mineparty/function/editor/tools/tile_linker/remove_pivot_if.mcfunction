#Needs $(pivot)
$execute at @n[tag=selected] if entity @n[nbt={UUID:$(pivot)},distance=0...5] run function mineparty:editor/tools/tile_linker/remove_pivot