function mineparty:other/calc/mod {amount:8,input:"#coin_rotation mineparty"}
execute if score #coin_rotation mineparty matches 0 run data modify entity @s transformation.right_rotation set value [0,0,0,1]
execute if score #coin_rotation mineparty matches 2 run data modify entity @s transformation.right_rotation set value [1,0,0,1]
execute if score #coin_rotation mineparty matches 4 run data modify entity @s transformation.right_rotation set value [1,0,0,0]
execute if score #coin_rotation mineparty matches 6 run data modify entity @s transformation.right_rotation set value [-1,0,0,1]