# Stop sound effect
execute on passengers if entity @s[type=interaction] on attacker run stopsound @s * minecraft:entity.player.attack.nodamage

# Lil effect
execute if entity @s[tag=!landed] run playsound minecraft:block.amethyst_block.fall player @a ~ ~ ~ 1 1
execute if entity @s[tag=!landed] run particle minecraft:wax_on ~ ~ ~ 0 0 0 20 30

# Shoots the coin up again
execute store result entity @s Motion[1] float 0.1 run random value 9..16
execute store result entity @s Motion[0] float 0.01 run random value -14..14
execute store result entity @s Motion[2] float 0.01 run random value -14..14
execute on passengers if entity @s[tag=coin_display] store result entity @s Rotation[0] float 1 run random value -180..179

# Roll semi-result
execute store result score #coin_result mineparty run random value 0..1
execute if score #coin_result mineparty matches 0 on passengers on attacker run title @s actionbar "Heads!"
execute if score #coin_result mineparty matches 1 on passengers on attacker run title @s actionbar "Tails!"

# Clear attacker data
execute on passengers if entity @s[type=interaction] run data remove entity @s attack.player