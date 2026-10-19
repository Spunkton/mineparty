# Randomly puts $(amount) items from $(input) into $(output)
# Syntax: function mineparty:other/pick_from_list {input:"(block|entity|storage) <target> [path]",output:"(block|entity|storage) <target> [path]"}

# Store list in a temporary storage

# Summon markers for parallel commands
execute at @p run function mineparty:other/summon_64
$execute as @e[type=marker,tag=64,limit=$(amount)] run say hi
kill @e[tag=64]