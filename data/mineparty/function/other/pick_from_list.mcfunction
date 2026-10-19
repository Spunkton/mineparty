# Randomly puts an item from $(input) into $(output)
# Syntax: function mineparty:other/pick_from_list {input:"(block|entity|storage) <target> [path]",output:"(block|entity|storage) <target> [path]"}

# Stores length of $(input) list
$execute store result score #random_max mineparty run data get $(input)
execute store result storage mineparty:main pick_from_list.max int 1 run scoreboard players remove #random_max mineparty 1

# Get random number
function mineparty:other/pick_from_list/random with storage mineparty:main pick_from_list

# Put into output
$data modify storage mineparty:main pick_from_list.input set value "$(input)"
$data modify storage mineparty:main pick_from_list.output set value "$(output)"
function mineparty:other/pick_from_list/output with storage mineparty:main pick_from_list