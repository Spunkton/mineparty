# Lose 3 gold if you roll a 0
execute if score @s dice_roll matches 0 run clear @s gold_ingot 3
execute if score @s dice_roll matches 0 run tellraw @s "\u00a7cYou lost 3 gold! (Skill issue)"
execute if score @s dice_roll matches 0 run tellraw @a[distance=.1..] [{"color":"red","text":""},{"selector":"@s"}," lost 3 gold! Laugh at them."]