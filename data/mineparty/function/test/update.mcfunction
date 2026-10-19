execute if entity @s[tag=looked_at] on vehicle if entity @s[tag=test_frame] run data modify entity @s item.id set value blue_stained_glass_pane
execute if entity @s[tag=looked_at] on vehicle on passengers if entity @s[tag=test_item] run data modify entity @s Glowing set value true
execute unless entity @s[tag=looked_at] on vehicle if entity @s[tag=test_frame] run data modify entity @s item.id set value white_stained_glass_pane
execute unless entity @s[tag=looked_at] on vehicle on passengers if entity @s[tag=test_item] run data modify entity @s Glowing set value false