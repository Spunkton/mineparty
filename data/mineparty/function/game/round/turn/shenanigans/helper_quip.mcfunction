# Get a random quip
function mineparty:other/pick_from_list {input:"storage mineparty:main quips.helper.random",output:"entity @n[tag=helper] data.random"}

# Speak!
tellraw @a ["<Helper> ",{"entity":"@n[tag=helper]","interpret":true,"nbt":"data.random"}]