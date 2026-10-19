# Executed as trident upon launch

# Summon bouncy ball with passengers
summon item ~ ~ ~ {PickupDelay:32767,Invulnerable:1b,Tags:["bouncy_ball","bouncy_ball_item"],Passengers:[{id:"minecraft:item_display",billboard:"fixed",Tags:["bouncy_ball","bouncy_ball_display"],brightness:{sky:15,block:15},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.5f,0.5f,0.5f]},item:{id:"minecraft:player_head",count:1,components:{"minecraft:profile":{"properties":[{"name":"textures","value":"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvNTExM2VlNjEwODQxZGVkMjE1YWNkMmI0Y2FhZWVmODdkZmQ2ZTNkNDc2OGU3YWI0ZTE5ZWI3NmIzZDgxMjFjZiJ9fX0="}]}}}},{id:"minecraft:interaction",width:0.35f,height:-0.35f,Tags:["bouncy_ball","bouncy_ball_interaction"],response:1b}],Item:{id:"minecraft:trident",count:1,components:{"!minecraft:attribute_modifiers":{},"minecraft:item_model":"air","minecraft:lore":[{"color":"gray","italic":false,"text":"Boioioioioioing"}],"minecraft:max_stack_size":64,"!minecraft:max_damage":{},"minecraft:custom_name":{"italic":false,"text":"Bouncy Ball"},"!minecraft:tool":{},"minecraft:custom_data":{bouncy_ball:1b}}}}

# Transfer velocity, bounciness and owner data
data modify entity @n[tag=bouncy_ball_item] Motion set from entity @s Motion
data modify entity @n[tag=bouncy_ball_item] Thrower set from entity @s Owner
data modify entity @n[tag=bouncy_ball_item] data.bounce set from entity @s data.bounce
execute if data entity @s data.texture run data modify entity @n[tag=bouncy_ball_item] data.texture set from entity @s data.texture
execute if data entity @s data.texture run data modify entity @n[tag=bouncy_ball_display] item.components."minecraft:profile".properties[].value set from entity @s data.texture
execute as @n[tag=bouncy_ball_item] run data modify entity @s data.old_motion set from entity @s Motion

# Tag as creative if owner is in creative (so item doesn't drop)
execute as @p if entity @s[gamemode=creative] run tag @n[tag=bouncy_ball_item] add creative

# Sound effect
stopsound @p * minecraft:item.trident.throw
playsound minecraft:entity.snowball.throw player @a ~ ~ ~ 0.3 0

# Byebye!
kill @s