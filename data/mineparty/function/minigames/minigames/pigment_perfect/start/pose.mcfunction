# Makes the armor stand strike a random pose

#execute store result score #random mineparty run random value 0..5

execute if score #random mineparty matches 1 run data modify entity @s Pose set value {Head:[15f,0f,0f],Body:[10f,0f,0f],LeftArm:[-40f,0f,-10f],RightArm:[40f,0f,10f],LeftLeg:[40f,0f,0f],RightLeg:[-40f,0f,0f]}
execute if score #random mineparty matches 2 run data modify entity @s Pose set value {Head:[352f,10f,357f],LeftArm:[128f,138f,0f],RightArm:[23f,338f,10f],LeftLeg:[0f,10f,353f],RightLeg:[0f,338f,10f]}
execute if score #random mineparty matches 3 run data modify entity @s Pose set value {Body:[356f,0f,0f],LeftArm:[119f,101f,0f],RightArm:[114f,265f,0f],LeftLeg:[333f,334f,0f],RightLeg:[333f,33f,0f]}
execute if score #random mineparty matches 4 run data modify entity @s Pose set value {Head:[14f,14f,348f],Body:[5f,10f,0f],LeftArm:[28f,0f,24f],RightArm:[32f,0f,330f],LeftLeg:[356f,0f,357f],RightLeg:[356f,0f,6f]}

# Discarded poses
#execute if score #random mineparty matches 5 run data modify entity @s Pose set value {Body:[356f,0f,0f],LeftArm:[14f,65f,0f],RightArm:[14f,297f,0f],LeftLeg:[269f,329f,0f],RightLeg:[269f,33f,0f]}