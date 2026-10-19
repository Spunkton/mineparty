# Start function from Sulfurball 
# Start functions are mandatory (just like lobby and abort functions), these run 3 seconds after everybody readies up.
# Note how the rulebook is not cleared by default, you have to clear them in the start function!

# Clear previous ball
tp @e[tag=sulfur_ball] 0 -100 0

# Clear rulebook <------------ NOT CLEARED BY DEFAULT
clear @a *[custom_data~{rulebook:true}]

# Set gamemodes
gamemode adventure @a[tag=!not_playing]

# Join teams
team leave @a[tag=!not_playing]
team join Blue @a[tag=forced_blue]
team join Pink @a[tag=forced_pink]
function mineparty:minigames/split_teams

# Give effects
effect give @a[tag=!not_playing] minecraft:resistance infinite 4 true

# Reset tags
tag @a remove lost

# Setup timer
function mineparty:timer/start {sec:120,command:"function mineparty:minigames/minigames/sulfurball/end"}

# Set scores
scoreboard players reset * minigames
scoreboard players reset * minigames_teams
scoreboard players reset * minigames_rank

scoreboard players set Blue minigames_teams 0
scoreboard players set Pink minigames_teams 0
scoreboard players display name Blue minigames_teams {"color":"aqua","text":"Blue"}
scoreboard players display name Pink minigames_teams {"color":"light_purple","text":"Pink"}

scoreboard objectives setdisplay sidebar minigames_teams

# Summon scoreboard(s)
function mineparty:minigames/minigames/sulfurball/update_scoreboard

# Teleport to start
tp @a[team=Blue] @n[tag=sulfurball_start_blue]
tp @a[team=Pink] @n[tag=sulfurball_start_pink]
execute as @a[team=Blue] at @s facing entity @n[tag=sulfurball_start_pink] eyes run tp @s ~ ~ ~ ~ ~
execute as @a[team=Pink] at @s facing entity @n[tag=sulfurball_start_blue] eyes run tp @s ~ ~ ~ ~ ~

# Starts tick loop
function mineparty:minigames/minigames/sulfurball/tick

# Summon ball
function mineparty:minigames/minigames/sulfurball/summon

# Give equipment
give @a[tag=!not_playing] wooden_sword[enchantments={"knockback":1,"lunge":1},custom_name={"color":"white","italic":false,"text":"Paddle"},piercing_weapon={},unbreakable={},minimum_attack_charge=0.7] 1
give @a[tag=!not_playing] fishing_rod[custom_name={"color":"white","italic":false,"text":"Hook"},unbreakable={}] 1