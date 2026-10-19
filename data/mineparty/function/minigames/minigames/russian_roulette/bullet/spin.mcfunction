# Effect
execute at @n[tag=root,tag=bullet,scores={minigames=0}] run particle minecraft:poof ~ ~0.6 ~ 0 0 0 0.05 16
execute at @n[tag=root,tag=bullet,scores={minigames=0}] run particle minecraft:gust ~0 ~0.8 ~ 0 0 0 0 1


# Spin the barrel
tp @n[tag=root,tag=bullet,scores={minigames=3}] @n[tag=root,tag=bullet,scores={minigames=2}]
tp @n[tag=root,tag=bullet,scores={minigames=2}] @n[tag=root,tag=bullet,scores={minigames=1}]
tp @n[tag=root,tag=bullet,scores={minigames=1}] @n[tag=root,tag=bullet,scores={minigames=0}]
tp @n[tag=root,tag=bullet,scores={minigames=0}] @n[tag=root,tag=bullet,scores={minigames=5}]
tp @n[tag=root,tag=bullet,scores={minigames=5}] @n[tag=root,tag=bullet,scores={minigames=4}]
tp @n[tag=root,tag=bullet,scores={minigames=4}] @n[tag=russian_roulette_display]
### Update location
scoreboard players remove @e[tag=bullet] minigames 1
### Empty bullet that got shot
execute as @e[tag=bullet,scores={minigames=-1},tag=!back] run data modify entity @s text set value ""
execute as @e[tag=bullet,scores={minigames=-1},tag=back] run data modify entity @s text set value {"color":"black","text":"⏺"}
### Loop back
scoreboard players set @e[tag=bullet,scores={minigames=-1}] minigames 5
