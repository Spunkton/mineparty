# Executed as and at player

advancement revoke @s only mineparty:other/doohickeys/coin

# Clear the coin if in creative
execute if entity @s[gamemode=creative] run clear @s *[custom_data~{coin:true}] 1

# Summon coin with some random deviations
summon item ~ ~ ~ {Age:-32768,PickupDelay:32767,Motion:[0.0,1.4,0.0],Tags:["coin","coin_item"],Passengers:[{id:"minecraft:item_display",interpolation_duration:2,Tags:["coin","coin_display","coin_heads"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,-0.21875f,0f],scale:[1f,1f,1f]},item:{id:"minecraft:music_disc_creator_music_box",count:1}},{id:"minecraft:interaction",height:-0.125f,response:1b,Tags:["coin","coin_interaction"]}],Item:{id:"minecraft:stone",count:1,components:{"minecraft:item_model":"air"}}}
execute store result entity @n[tag=coin_item] Motion[1] float 0.1 run random value 12..17
execute store result entity @n[tag=coin_item] Motion[0] float 0.01 run random value -9..9
execute store result entity @n[tag=coin_item] Motion[2] float 0.01 run random value -9..9
execute store result entity @n[tag=coin_display] Rotation[0] float 1 run random value -180..179