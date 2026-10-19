#Sets dice roll to selected item slot +1
execute store result score @s dice_roll run data get entity @s SelectedItemSlot
scoreboard players add @s dice_roll 1