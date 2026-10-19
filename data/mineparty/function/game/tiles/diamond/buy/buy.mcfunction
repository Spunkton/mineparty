# Executed as player buying diamond

# Remove trigger priveledges
execute as @a run trigger mineparty_custom_trigger set -1

# Give diamond
$execute at @n[tag=diamond] run summon item ~ ~11.5 ~ {Tags:["purchased_diamond"],NoGravity:1b,Glowing:1b,Motion:[0.0,-0.21,0.0],Age:-32768,Owner:$(UUID),Invulnerable:1b,Item:{id:"minecraft:diamond",count:1}}

# Pay
$clear @p[tag=will_continue] gold_ingot $(price)

# Remove diamond spot
function mineparty:game/tiles/diamond/remove

# Continue on when diamond is recieved
data modify entity @n[tag=helper] data.queue set value ["Congratulations on obtaining a diamond!","That means it's time to spawn a new diamond!"]
data modify entity @n[tag=helper] data.command set value "function mineparty:game/tiles/diamond with storage mineparty:main playing_game"
data modify storage mineparty:main command_queue prepend value "function mineparty:game/tiles/move/continue"
data modify storage mineparty:main command_queue prepend value "function mineparty:game/helper/dialog/speak"
function mineparty:game/tiles/diamond/buy/wait_for_reception