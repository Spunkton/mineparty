#Executes function based on trigger
execute as @a[scores={mineparty_custom_trigger=0..}] at @s run summon marker ~ ~ ~ {Tags:["trigger"]}
execute as @a[scores={mineparty_custom_trigger=0..}] at @s store result entity @n[type=marker,tag=trigger] data.number int 1 run scoreboard players get @s mineparty_custom_trigger
execute as @a[scores={mineparty_custom_trigger=0..}] at @s run function mineparty:other/custom_trigger/pick with entity @n[type=marker,tag=trigger] data
execute as @a[scores={mineparty_custom_trigger=0..}] at @s run function mineparty:command with entity @n[type=marker,tag=trigger] data

#Resets trigger value
scoreboard players set @a mineparty_custom_trigger -1
kill @n[type=marker,tag=trigger]