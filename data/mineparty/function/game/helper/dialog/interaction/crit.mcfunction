# Tag self as puncher
tag @s add puncher
stopsound @s * minecraft:entity.player.attack.nodamage

# Calculate if crit applies (1/16 chance)
execute store result score #helper_crit mineparty run random value 0..15

# If crit
execute if score #helper_crit mineparty matches 0 run tag @s add crit
execute if score #helper_crit mineparty matches 0 run function mineparty:game/helper/dialog/interaction/attack_impact_0
execute if score #helper_crit mineparty matches 0 run return 2

# No crit
function mineparty:game/helper/dialog/interaction/attack