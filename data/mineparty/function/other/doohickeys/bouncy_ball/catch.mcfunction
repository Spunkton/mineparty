# Give ball (unless in creative and already has one)
execute on target unless entity @s[gamemode=creative,nbt={Inventory:[{id:"minecraft:trident",components:{"minecraft:custom_data":{bouncy_ball:1b}}}]}] run function mineparty:other/doohickeys/bouncy_ball/get

# Effects!
playsound minecraft:entity.item.pickup player @a ~ ~ ~ 1 1
execute on vehicle if entity @s[predicate=!mineparty:on_ground] run particle wax_off ~ ~ ~ 0 0 0 1 10
execute on vehicle if entity @s[predicate=!mineparty:on_ground] run particle minecraft:trial_spawner_detection_ominous ~ ~ ~ 0 0 0 0.1 20
execute on vehicle if entity @s[predicate=!mineparty:on_ground] run particle minecraft:sonic_boom ~ ~ ~ 0 0 0 0 0
execute on vehicle if entity @s[predicate=!mineparty:on_ground] run playsound minecraft:entity.ender_eye.death player @a ~ ~ ~ 1 1

# Kill entities
execute on vehicle on passengers if entity @s[tag=bouncy_ball_display] run kill @s
execute on vehicle run kill @s
kill @s