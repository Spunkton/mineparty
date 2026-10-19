# Tps one twelfth of the way
# Needs $(target), executed as the one teleporting (does not work on players)
# Useful for block displays with tp durations so they can move smoothly

# !!! WARNING !!!
# Stops working beyond 20,000,000 ~ 20,000,000

# Cancel if close enough
#$execute at $(target) if entity @s[distance=.2..] run return 0

# Store current coords
execute store result score #smooth_tp_x mineparty run data get entity @s Pos[0] 100
execute store result score #smooth_tp_y mineparty run data get entity @s Pos[1] 100
execute store result score #smooth_tp_z mineparty run data get entity @s Pos[2] 100

# Store target coords
$execute store result score #smooth_tp_target_x mineparty run data get entity $(target) Pos[0] 100
$execute store result score #smooth_tp_target_y mineparty run data get entity $(target) Pos[1] 100
$execute store result score #smooth_tp_target_z mineparty run data get entity $(target) Pos[2] 100

# Calculate new coords
### Multiply old coords by 11
function mineparty:other/calc/mult {amount:11,input:"#smooth_tp_x mineparty"}
function mineparty:other/calc/mult {amount:11,input:"#smooth_tp_y mineparty"}
function mineparty:other/calc/mult {amount:11,input:"#smooth_tp_z mineparty"}
### Add target coords
scoreboard players operation #smooth_tp_target_x mineparty += #smooth_tp_x mineparty
scoreboard players operation #smooth_tp_target_y mineparty += #smooth_tp_y mineparty
scoreboard players operation #smooth_tp_target_z mineparty += #smooth_tp_z mineparty
### Divide total by 12
function mineparty:other/calc/div {amount:12,input:"#smooth_tp_target_x mineparty"}
function mineparty:other/calc/div {amount:12,input:"#smooth_tp_target_y mineparty"}
function mineparty:other/calc/div {amount:12,input:"#smooth_tp_target_z mineparty"}

# Move original entity
execute store result entity @s Pos[0] float 0.01 run scoreboard players get #smooth_tp_target_x mineparty
execute store result entity @s Pos[1] float 0.01 run scoreboard players get #smooth_tp_target_y mineparty
execute store result entity @s Pos[2] float 0.01 run scoreboard players get #smooth_tp_target_z mineparty