# Pays as much debt as possible
# @s is the one paying

execute store result storage mineparty:main temp.debt.amount int 1 store result score #debt_check mineparty run clear @s *[minecraft:custom_data~{debt:true}] 0
execute store result storage mineparty:main temp.gold.amount int 1 store result score #gold_check mineparty run clear @s gold_ingot 0

# Stop if there is no debt
execute if score #debt_check mineparty matches ..0 run advancement revoke @s only mineparty:game/items/debt
execute if score #debt_check mineparty matches ..0 run return fail

# If you have enough gold to pay it all
execute if score #debt_check mineparty <= #gold_check mineparty run function mineparty:game/items/debt/pay/clear_gold with storage mineparty:main temp.debt
execute if score #debt_check mineparty <= #gold_check mineparty run clear @s *[minecraft:custom_data~{debt:true}]
execute if score #debt_check mineparty <= #gold_check mineparty run advancement revoke @s only mineparty:game/items/debt
execute if score #debt_check mineparty <= #gold_check mineparty run return 2

# If there is not enough gold
execute if score #debt_check mineparty > #gold_check mineparty run function mineparty:game/items/debt/pay/clear_debt with storage mineparty:main temp.gold
execute if score #debt_check mineparty > #gold_check mineparty run clear @s gold_ingot
execute if score #debt_check mineparty > #gold_check mineparty run advancement revoke @s only mineparty:game/items/debt
execute if score #debt_check mineparty > #gold_check mineparty run return 1