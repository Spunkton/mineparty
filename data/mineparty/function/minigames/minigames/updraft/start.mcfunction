# Kill possible leftovers
kill @e[tag=updraft_resource]

# Clear rulebook
clear @a *[custom_data~{rulebook:true}]

# Set gamemodes
gamemode adventure @a[tag=!not_playing]
gamemode spectator @a[tag=not_playing]

# Set gamerules
execute store result score #gamerule_fall_damage mineparty run gamerule fall_damage
execute store result score #gamerule_pvp mineparty run gamerule pvp
gamerule fall_damage false
gamerule pvp true

# Give effects
effect give @a[tag=!not_playing] minecraft:resistance infinite 4 true

# Set attributes
execute as @a run attribute @s minecraft:jump_strength base set 1.3

# Setup timer
function mineparty:timer/start {sec:60,command:"function mineparty:minigames/minigames/updraft/end"}

# Set scores
scoreboard players reset * minigames
scoreboard players set @a[tag=!not_playing] minigames 0
# Set up scoreboard
scoreboard objectives setdisplay sidebar minigames
scoreboard objectives modify minigames displayname {"color":"gold","text":"Score"}

# Summon altometer
function mineparty:minigames/minigames/updraft/altometer

# Teleport to start
tp @a @n[tag=updraft_start]

# Starts tick loop
function mineparty:minigames/minigames/updraft/tick

# Summon resources
function mineparty:multi_command {amount:24,command:"function mineparty:minigames/minigames/updraft/summon/resource {resource:coal}"}
function mineparty:multi_command {amount:8,command:"function mineparty:minigames/minigames/updraft/summon/resource {resource:copper}"}
function mineparty:multi_command {amount:4,command:"function mineparty:minigames/minigames/updraft/summon/resource {resource:iron}"}
function mineparty:multi_command {amount:2,command:"function mineparty:minigames/minigames/updraft/summon/resource {resource:gold}"}
function mineparty:multi_command {amount:1,command:"function mineparty:minigames/minigames/updraft/summon/resource {resource:diamond}"}

function mineparty:multi_command {amount:5,command:"function mineparty:minigames/minigames/updraft/summon/resource {resource:lapis}"}
function mineparty:multi_command {amount:5,command:"function mineparty:minigames/minigames/updraft/summon/resource {resource:redstone}"}
function mineparty:multi_command {amount:5,command:"function mineparty:minigames/minigames/updraft/summon/resource {resource:emerald}"}
function mineparty:multi_command {amount:5,command:"function mineparty:minigames/minigames/updraft/summon/resource {resource:amethyst}"}

# Give equipment
give @a[tag=!not_playing] mace[minimum_attack_charge=0.8,enchantments={"wind_burst":1},attribute_modifiers=[{id:"attack_speed",type:"attack_speed",amount:-0.7,operation:"add_multiplied_total",slot:"mainhand",display:{type:"hidden"}},{id:"attack_damage",type:"attack_damage",amount:1,operation:"add_value",slot:"mainhand",display:{type:"hidden"}},{id:"entity_interaction_range",type:"entity_interaction_range",amount:1.5,operation:"add_value",slot:"mainhand",display:{type:"override",value:{"color":"gold","text":"+1.5 Attack Range"}}}],custom_data={updraft_mace:true},unbreakable={}] 1