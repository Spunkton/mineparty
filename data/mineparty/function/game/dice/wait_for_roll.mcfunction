# Announce rolls
execute as @a[tag=rolled_dice,tag=!dice_disabled,scores={dice_roll=0..},tag=!not_playing] run tellraw @a ["\u00a7a",{"selector":"@s"},"\u00a7a rolled ",{"score":{"name":"@s","objective":"dice_roll"}}]

# Run if everyone has rolled-dice tag
execute unless entity @p[tag=!rolled_dice,tag=!not_playing] run function mineparty:command_queue
execute unless entity @p[tag=!rolled_dice,tag=!not_playing] run tag @a remove dice_disabled
execute unless entity @p[tag=!rolled_dice,tag=!not_playing] run return 0

# Make sure people don't roll again
tag @a[tag=!rolled_dice,tag=!not_playing] remove dice_disabled
tag @a[tag=rolled_dice,tag=!not_playing] add dice_disabled

# Schedule self if not everyone has rolled yet
schedule function mineparty:game/dice/wait_for_roll 1t

# Actionbar message
execute if data storage mineparty:main wait_for_roll_message.dice as @a[tag=!rolled_dice,tag=!not_playing] if items entity @s weapon.* *[custom_data~{dice:true}] run title @s actionbar {"interpret":true,"nbt":"wait_for_roll_message.dice","storage":"mineparty:main"}
execute if data storage mineparty:main wait_for_roll_message.no_dice as @a[tag=!rolled_dice,tag=!not_playing] unless items entity @s weapon.* *[custom_data~{dice:true}] run title @s actionbar {"interpret":true,"nbt":"wait_for_roll_message.no_dice","storage":"mineparty:main"}

# Give die if they don't have one
execute as @a[tag=!no_die_at_roll,tag=!not_playing,tag=!dice_disabled] at @s unless items entity @s player *[minecraft:custom_data~{dice:true}] run function mineparty:game/dice/get/default
