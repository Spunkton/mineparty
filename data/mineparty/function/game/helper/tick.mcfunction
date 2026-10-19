# Interactions
# Attack
execute as @n[tag=helper_interaction] unless entity @p[tag=puncher] on attacker run function mineparty:game/helper/dialog/interaction/crit
execute as @n[tag=helper_interaction] on target run function mineparty:game/helper/dialog/interaction/interact

# Cleanup
### Kill mutual entities if other is gone
execute unless entity @n[type=interaction,tag=helper_interaction] run kill @n[tag=helper_interaction_ride]
execute unless entity @n[tag=helper_interaction_ride] run kill @n[type=interaction,tag=helper_interaction]
### Reset last interaction
execute as @n[tag=helper_interaction] on attacker run data remove entity @n[type=interaction,tag=helper_interaction] attack
execute as @n[tag=helper_interaction] on target run data remove entity @n[type=interaction,tag=helper_interaction] interaction

# Summon interaction that follows allay around (if gone somehow)
execute at @n[tag=helper] unless entity @n[tag=helper_interaction] run summon item_display ~ ~-0.1 ~ {teleport_duration:3,Tags:["helper_interaction_ride"],Passengers:[{id:"minecraft:interaction",width:0.5f,height:0.8f,response:1b,Tags:["helper_interaction"],CustomName:"Helper"}],item:{id:"minecraft:air",count:1}}
execute at @n[tag=helper] run tp @n[tag=helper_interaction_ride] ~ ~-0.1 ~