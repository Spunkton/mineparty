# Land nicely
execute on passengers run data modify entity @s interpolation_duration set value 0
execute on passengers run data modify entity @s transformation.right_rotation set value [1,0,0,1]

# Tag yourself
tag @s add landed