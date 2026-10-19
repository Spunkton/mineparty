# Speaks a line, or if there are no lines, runs command

#Run command if at the end of speech
execute unless data entity @n[tag=helper] data.queue[0] run function mineparty:command with entity @n[tag=helper] data
execute unless data entity @n[tag=helper] data.queue[0] run return 1

#Stores data in data.dialog
#data modify entity @n[tag=helper] data.dialog set from entity @n[tag=helper] data.queue[0]

#Speak line
tellraw @a ["<Helper> ",{"entity":"@n[tag=helper]","interpret":true,"nbt":"data.queue[0]"}]

#Sound effect
execute at @n[tag=helper] run playsound minecraft:entity.allay.item_given neutral @a ~ ~ ~ 1

#Calculate length to wait before next dialog
#(character length)+20 ticks
execute store result entity @n[tag=helper] data.dialog_length int 0.8 run data get entity @n[tag=helper] data.queue[0]
execute store result score #dialog_length mineparty run data get entity @n[tag=helper] data.dialog_length
execute store result entity @n[tag=helper] data.dialog_length int 1 run scoreboard players add #dialog_length mineparty 30

#Remove from queue
data remove entity @n[tag=helper] data.queue[0]

#Schedule dialog
function mineparty:game/helper/dialog/schedule with entity @n[tag=helper] data