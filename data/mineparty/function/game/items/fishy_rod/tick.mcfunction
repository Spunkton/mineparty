# Tag bobber coming from a fishy rod
execute as @e[type=minecraft:fishing_bobber,tag=!fishing_bobber] at @s on origin if items entity @s weapon.* minecraft:fishing_rod[minecraft:custom_data~{fishy_rod:true}] run tag @n[distance=...1,type=minecraft:fishing_bobber] add fishy_bobber

# Particle marker for those that are hooked
execute if entity @n[type=fishing_bobber,tag=fishy_bobber] as @a at @s positioned ~ ~1.44 ~ as @n[type=fishing_bobber,distance=...1] on origin if items entity @s weapon.mainhand minecraft:fishing_rod[minecraft:custom_data~{fishy_rod:true}] run particle dust_color_transition{from_color:[1.000,1.000,1.000],to_color:[1.000,0.800,0.000],scale:1} ~ ~.75 ~ 0 0 0 0 0 normal