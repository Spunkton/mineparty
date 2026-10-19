# Schedule self if diamond is still there
execute at @n[tag=purchased_diamond] run particle minecraft:trial_spawner_detection_ominous ~ ~0.5 ~ 0.04 0 0.04 0.01 1
execute if entity @n[tag=purchased_diamond] run schedule function mineparty:game/tiles/diamond/buy/wait_for_reception 1t
execute if entity @n[tag=purchased_diamond] run return 0

# Particles!
execute at @p[tag=will_continue] run particle minecraft:end_rod ~ ~1 ~ 0 0 0 0.3 100

# Notify everyone
tellraw @p[tag=will_continue] "\u00a7bYou obtained a diamond!"
tellraw @a[tag=!will_continue] [{"color":"aqua","text":""},{"selector":"@p[tag=will_continue]"}," obtained a diamond!"]

# Continue
schedule function mineparty:command_queue 3s
schedule function mineparty:command_queue 18s append