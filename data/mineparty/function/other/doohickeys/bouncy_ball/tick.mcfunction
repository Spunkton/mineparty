# Summon from trident
execute as @e[type=trident,nbt={data:{bouncy_ball:1b}}] at @s run function mineparty:other/doohickeys/bouncy_ball/throw

# If caught
execute as @e[type=interaction,tag=bouncy_ball_interaction] if data entity @s interaction.player at @s run function mineparty:other/doohickeys/bouncy_ball/catch

# Bounce
execute as @e[type=item,tag=bouncy_ball_item,predicate=mineparty:doohickey/hit_wall] at @s run function mineparty:other/doohickeys/bouncy_ball/bounce

# Reset age if not on ground
execute as @e[type=item,tag=bouncy_ball_item,predicate=!mineparty:on_ground] run data modify entity @s Age set value 0s

# Store old momentum
execute as @e[type=item,tag=bouncy_ball_item] run data modify entity @s data.old_motion set from entity @s Motion

# Kill under circumstances
execute as @e[type=item,tag=bouncy_ball_item] at @s unless entity @p[distance=..128] run kill @e[tag=bouncy_ball,distance=..1]
execute as @e[type=item,tag=bouncy_ball_item,nbt={Age:40s},tag=!creative] at @s run function mineparty:other/doohickeys/bouncy_ball/despawn with entity @s data
kill @e[type=item,tag=bouncy_ball_item,nbt={Age:40s}]
execute as @e[tag=bouncy_ball] at @s unless entity @n[type=item,tag=bouncy_ball_item,distance=..0.3] run kill @s