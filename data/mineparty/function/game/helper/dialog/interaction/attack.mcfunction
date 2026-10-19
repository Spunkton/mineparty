# Unpause helper
execute unless data storage mineparty:main playing_minigame run data modify entity @n[tag=helper] NoAI set value false

# Stop swing sound
stopsound @a * minecraft:entity.puffer_fish.blow_up

# Remove impact frame and glow
data modify entity @n[tag=helper] Glowing set value false
kill @e[tag=impact_frame]

# Advancement
advancement grant @p[tag=puncher] only mineparty:mineparty/attack_helper


# Take damage
### Remove invulnerability for a bit
data modify entity @n[tag=helper] Invulnerable set value false
### Take damage
execute as @p[tag=puncher] at @s run damage @n[tag=helper] 0.00000001 minecraft:player_attack at ~ ~ ~
### Increase knockback (if crit)
execute if entity @p[tag=puncher,tag=crit] as @n[tag=helper] at @s store result entity @s Motion[0] double 0.001 run data get entity @s Motion[0] 20000
execute if entity @p[tag=puncher,tag=crit] as @n[tag=helper] at @s store result entity @s Motion[1] double 0.001 run data get entity @s Motion[1] 20000
execute if entity @p[tag=puncher,tag=crit] as @n[tag=helper] at @s store result entity @s Motion[2] double 0.001 run data get entity @s Motion[2] 20000
### Regain immortality
data modify entity @n[tag=helper] Invulnerable set value true

# Roll random response
execute store result score #helper_dialog mineparty run random value 0..90

# Response
execute if score #helper_dialog mineparty matches 0..9 run title @p[tag=puncher] actionbar "<Helper> Ouch!"
execute if score #helper_dialog mineparty matches 10..19 run title @p[tag=puncher] actionbar "<Helper> Oof!"
execute if score #helper_dialog mineparty matches 20..29 run title @p[tag=puncher] actionbar "<Helper> Eurgh!"
execute if score #helper_dialog mineparty matches 30..39 run title @p[tag=puncher] actionbar "<Helper> Eek!"
execute if score #helper_dialog mineparty matches 40..49 run title @p[tag=puncher] actionbar "<Helper> Yowchie!"
execute if score #helper_dialog mineparty matches 50..59 run title @p[tag=puncher] actionbar "<Helper> Zoinks!"
execute if score #helper_dialog mineparty matches 60..69 run title @p[tag=puncher] actionbar "<Helper> Aargh!"
execute if score #helper_dialog mineparty matches 70..79 run title @p[tag=puncher] actionbar "<Helper> Mmphf!"
execute if score #helper_dialog mineparty matches 80..89 run title @p[tag=puncher] actionbar "<Helper> *Breaks bones*"
execute if score #helper_dialog mineparty matches 90 run title @p[tag=puncher] actionbar "<Helper> I miss my wife."

# If crit
execute if entity @p[tag=puncher,tag=crit] run title @p[tag=puncher] actionbar "                                                                                                                                                                                                          <Helper> AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"

# Look at what you did!
execute at @n[tag=helper] run playsound minecraft:entity.allay.hurt neutral @a ~ ~ ~ 0.5
execute if entity @p[tag=puncher,tag=crit] at @n[tag=helper] run playsound minecraft:entity.allay.hurt neutral @a ~ ~ ~ 0.5 0
execute if entity @p[tag=puncher,tag=crit] at @n[tag=helper] run particle minecraft:end_rod ~ ~ ~ 0 0 0 1 100

# Remove puncher tag
tag @a remove puncher
tag @a remove crit