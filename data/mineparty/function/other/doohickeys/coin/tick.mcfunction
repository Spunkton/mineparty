# For the coin fliping animation
scoreboard players add #coin_rotation mineparty 1
execute as @e[type=item,tag=coin_item,predicate=!mineparty:on_ground] on passengers run function mineparty:other/doohickeys/coin/spin
execute as @e[type=item,tag=coin_item,predicate=mineparty:on_ground,tag=!landed] run function mineparty:other/doohickeys/coin/land
execute as @e[type=interaction,tag=coin_interaction] if data entity @s interaction.player on vehicle at @s run function mineparty:other/doohickeys/coin/pick
execute as @e[type=interaction,tag=coin_interaction] if data entity @s attack.player on vehicle if entity @s[tag=!landed] at @s run function mineparty:other/doohickeys/coin/hit