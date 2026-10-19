# Save motion with (poorly calculated) friction factored in
$execute store result entity @s data.old_motion[0] double 0.001 run data get entity @s data.old_motion[0] $(bounce)
$execute store result entity @s data.old_motion[1] double 0.001 run data get entity @s data.old_motion[1] $(bounce)
$execute store result entity @s data.old_motion[2] double 0.001 run data get entity @s data.old_motion[2] $(bounce)