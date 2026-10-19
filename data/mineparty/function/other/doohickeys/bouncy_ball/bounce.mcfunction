# Executed as item with the block display and interaction as passengers

# Check for motion values
### Old
execute store result score #x_bounce_motion_old mineparty run data get entity @s data.old_motion[0] 100
execute store result score #y_bounce_motion_old mineparty run data get entity @s data.old_motion[1] 100
execute store result score #z_bounce_motion_old mineparty run data get entity @s data.old_motion[2] 100
### New
execute store result score #x_bounce_motion mineparty run data get entity @s Motion[0] 1000
execute store result score #y_bounce_motion mineparty run data get entity @s Motion[1] 1000
execute store result score #z_bounce_motion mineparty run data get entity @s Motion[2] 1000

# Tag self is bounce is happening
execute if score #x_bounce_motion mineparty matches 0 unless score #x_bounce_motion_old mineparty matches 0 run tag @s add bouncing
execute if score #y_bounce_motion mineparty matches 0 unless score #y_bounce_motion_old mineparty matches 0 run tag @s add bouncing
execute if score #z_bounce_motion mineparty matches 0 unless score #z_bounce_motion_old mineparty matches 0 run tag @s add bouncing

# Check for bounce
execute if entity @s[tag=bouncing] if score #x_bounce_motion mineparty matches 0 run execute store result entity @s data.old_motion[0] double -0.0001 run data get entity @s data.old_motion[0] 10000
execute if entity @s[tag=bouncing] if score #y_bounce_motion mineparty matches 0 run execute store result entity @s data.old_motion[1] double -0.0001 run data get entity @s data.old_motion[1] 10000
execute if entity @s[tag=bouncing] if score #z_bounce_motion mineparty matches 0 run execute store result entity @s data.old_motion[2] double -0.0001 run data get entity @s data.old_motion[2] 10000

# Bounce!
execute if entity @s[tag=bouncing] run function mineparty:other/doohickeys/bouncy_ball/old_motion with entity @s data
execute if entity @s[tag=bouncing] run data modify entity @s Motion set from entity @s data.old_motion

# Remove velocity if old motion is too low to prevent sliding
execute if score #x_bounce_motion_old mineparty matches 0 run data modify entity @s Motion[0] set value 0
execute if entity @s[predicate=mineparty:on_ground] if score #y_bounce_motion_old mineparty matches -2..2 run data modify entity @s Motion[1] set value 0
execute if score #z_bounce_motion_old mineparty matches 0 run data modify entity @s Motion[2] set value 0

# Particles!
execute if entity @s[tag=bouncing] run particle end_rod ~ ~ ~ 0 0 0 0.07 5
#execute if entity @s[predicate=!mineparty:on_ground] run particle wax_off ~ ~ ~ 0 0 0 0 1

# Sounds!
execute if entity @s[tag=bouncing] run playsound minecraft:entity.armor_stand.place block @a ~ ~ ~ 0.4 2

# To make bouncing off the ground easier
data modify entity @s[tag=bouncing] OnGround set value false

# Remove tag
tag @s remove bouncing