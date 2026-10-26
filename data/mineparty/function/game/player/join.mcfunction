# Makes latecomer fully join the game from the starting tile
# Executed as latecomer
# Needs $(map)

# Cancel if already a player
execute if entity @s[tag=player] run tellraw @p[tag=host] [{"color":"red","text":""},{"selector":"@s"}," is already a player!"]
execute if entity @s[tag=player] run return fail

# Cancel if minigame is ongoing
execute if data storage mineparty:main playing_minigame run tellraw @p[tag=host] {"color":"red","text":"Minigame is currently ongoing."}
execute if data storage mineparty:main playing_minigame run return fail

# Clear items if they were not playing before
clear @s[tag=not_playing] *[custom_data~{dice:true}]
clear @s[tag=not_playing] *[custom_data~{game_item:true}]

# Remove not_playing tag
tag @s remove not_playing
tag @s remove temp_not_playing

# Add player tag
tag @s add player

# Update player count
execute store result score player_count mineparty if entity @a[tag=player]
### Workaround so end-of-round minigames don't happen twice
execute store result score #turn_phase mineparty run data get storage mineparty:main turn.phase
scoreboard players operation #turn+1 mineparty = turn mineparty
scoreboard players add #turn+1 mineparty 2
execute if score #turn_phase mineparty matches 2 if score #turn+1 mineparty = player_count mineparty run scoreboard players add turn mineparty 1

# Give 10 starting gold
execute unless items entity @s player minecraft:gold_ingot run function mineparty:game/items/gold/give {amount:10}

# Tp to start
$execute at @n[nbt={data:{map:"$(map)"}},tag=start,sort=random] run tp @s ~ ~ ~
### Occupy start
execute at @s run function mineparty:game/tiles/occupy

# Append to turn order
data modify storage mineparty:main turn_order append value {UUID:[I;1,1,1,1]}
data modify storage mineparty:main turn_order[-1].UUID set from entity @s UUID

# Adventure mode
gamemode adventure @s

# Particles and effects
execute at @s run playsound minecraft:block.amethyst_block.break player @a ~ ~ ~ 1 1 0.2

# Notify
tellraw @a [{"color":"green","text":""},{"color":"white","selector":"@s"}," has joined the party!"]