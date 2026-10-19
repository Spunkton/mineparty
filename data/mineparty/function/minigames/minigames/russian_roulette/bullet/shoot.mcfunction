advancement revoke @s only mineparty:minigames/russian_roulette/shoot

# Return fail if...
execute as @n[tag=russian_roulette_shoot] at @s unless block ~ ~ ~ #minecraft:buttons[powered=true] run return fail
execute unless entity @p[tag=taking_shot] run return fail
### Special message
execute unless score #can_shoot minigames matches 1 run tellraw @s {"color":"gray","text":"Death knows patience, so should you."}
execute unless score #can_shoot minigames matches 1 run return fail

# Temporarily turn of shooting (against spam)
scoreboard players set #can_shoot minigames 0

# If current bullet is lethal...
execute if entity @n[tag=lethal,scores={minigames=0}] run return run function mineparty:minigames/minigames/russian_roulette/bullet/kill

# Otherwise keep spinning
function mineparty:minigames/minigames/russian_roulette/bullet/spin
execute at @n[tag=russian_roulette_shoot] run playsound minecraft:ui.button.click block @a ~ ~ ~ 1 2 0.2
schedule function mineparty:minigames/minigames/russian_roulette/bullet/survive 2s