# Diamond spawn animation is handled here

# Schedule self
schedule function mineparty:game/tiles/diamond/animation/tick 1t

# Tick down
scoreboard players remove #diamond_animation mineparty 1

# Summon the rings
execute if score #diamond_animation mineparty matches 93..100 at @n[tag=diamond,tag=tile] positioned ~ ~-12 ~ run function mineparty:map/indicator/diamond/single_orbit_top
execute if score #diamond_animation mineparty matches 93..100 at @n[tag=diamond,tag=tile] positioned ~ ~-12 ~ run function mineparty:map/indicator/diamond/single_orbit_bottom
execute as @e[tag=orbit,tag=diamond_indicator] at @s run function mineparty:other/animation/smooth_tp {target:"@n[tag=diamond,tag=tile]"}
execute if score #diamond_animation mineparty matches 90..100 as @e[tag=orbit,tag=clockwise,tag=diamond_indicator] at @s run tp @s ~ ~ ~ ~45 ~
execute if score #diamond_animation mineparty matches 90..100 as @e[tag=orbit,tag=counter,tag=diamond_indicator] at @s run tp @s ~ ~ ~ ~-45 ~
execute if score #diamond_animation mineparty matches 7..89 run function mineparty:game/tiles/diamond/animation/rotate_orbits

# Summon the small diamond
execute if score #diamond_animation mineparty matches 60 at @n[tag=diamond,tag=tile] positioned ~ ~-13 ~ run function mineparty:map/indicator/diamond/small
execute as @n[tag=small,tag=diamond_indicator] at @s run function mineparty:other/animation/smooth_tp_slow {target:"@n[tag=diamond,tag=tile]"}
execute if score #diamond_animation mineparty matches 50..60 as @n[tag=diamond_indicator,tag=small] at @s run tp @s ~ ~ ~ ~15 ~
execute if score #diamond_animation mineparty matches 10..49 run function mineparty:game/tiles/diamond/animation/shrink_small_diamond
execute if score #diamond_animation mineparty matches 0..49 run function mineparty:game/tiles/diamond/animation/rotate_small_diamond

# Sound effect
execute if score #diamond_animation mineparty matches 45 as @n[tag=diamond,tag=tile] at @s run playsound minecraft:block.trial_spawner.about_to_spawn_item block @a ~ ~ ~ 0.5 1 0.5
execute if score #diamond_animation mineparty matches 85 as @n[tag=diamond,tag=tile] at @s run playsound minecraft:block.portal.trigger block @a ~ ~ ~ 0.07 1 0.07


# Particles
execute if score #diamond_animation mineparty matches 40..49 as @n[tag=diamond,tag=tile] at @s run particle minecraft:ominous_spawning ~ ~11.5 ~ 0 0 0 5 100
execute if score #diamond_animation mineparty matches 50..59 as @n[tag=diamond,tag=tile] at @s run particle minecraft:ominous_spawning ~ ~11.5 ~ 0 0 0 5 50

# Summon lightning for no reason
#execute if score #diamond_animation mineparty matches 4 at @n[tag=diamond,tag=tile] run summon lightning_bolt ~ ~11.5 ~
#stopsound @a * minecraft:entity.lightning_bolt.impact
#stopsound @a * minecraft:entity.lightning_bolt.thunder

# Summon the floor
execute if score #diamond_animation mineparty matches 4 at @n[tag=diamond,tag=tile] run function mineparty:map/indicator/diamond/floor

# Summon the big diamond
execute if score #diamond_animation mineparty matches 4 at @n[tag=diamond,tag=tile] run function mineparty:map/indicator/diamond/big


# Impact frames?
execute if score #diamond_animation mineparty matches 4 as @a[tag=!no_flashing_imagery] at @s anchored eyes run summon text_display ^ ^ ^0.7 {billboard:"center",see_through:1b,Tags:["impact_frame"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,-5f,0f],scale:[20f,50f,20f]},text:{"color":"black","text":"       "},background:-16777216}
execute if score #diamond_animation mineparty matches 4 as @e[tag=diamond_indicator] run data modify entity @s Glowing set value true
execute if score #diamond_animation mineparty matches 2 as @a[tag=!no_flashing_imagery] at @s anchored eyes run summon text_display ^ ^ ^0.7 {billboard:"center",see_through:1b,Tags:["impact_frame"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,-5f,0f],scale:[20f,50f,20f]},text:{"color":"black","text":"       "},background:-1}
execute if score #diamond_animation mineparty matches 2 as @e[tag=diamond_indicator] run data modify entity @s glow_color_override set value 0
execute if score #diamond_animation mineparty matches 2 run data modify entity @n[tag=main_diamond] transformation set value {left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-1.25f,10.25f,-1.25f],scale:[2.5f,2.5f,2.5f]}

# Post ending
execute if score #diamond_animation mineparty matches 0 as @e[tag=orbit,tag=clockwise,tag=diamond_indicator] at @s run tp @s ~ ~ ~ ~75 ~
execute if score #diamond_animation mineparty matches 0 as @e[tag=orbit,tag=counter,tag=diamond_indicator] at @s run tp @s ~ ~ ~ ~-75 ~
execute if score #diamond_animation mineparty matches -50..-1 run function mineparty:game/tiles/diamond/animation/rotate_orbits_post

# Ending stuff
execute if score #diamond_animation mineparty matches 0 run function mineparty:game/tiles/diamond/animation/end

# Clear schedule if 
execute if score #diamond_animation mineparty matches ..-50 run schedule clear mineparty:game/tiles/diamond/animation/tick


