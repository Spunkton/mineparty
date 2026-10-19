# Removes player with $(UUID) from board and minigames

# Remove from turn order
$function mineparty:game/start/turn_order/remove {UUID:$(UUID)}

# Remove from occupied tiles (expensive but whatever)
$function mineparty:game/tiles/remove_occupation {UUID:$(UUID)}

# Clear score so they come back as latecomer if they were gone
scoreboard players reset * gold
execute as @a unless entity @s[tag=not_playing,tag=!temp_not_playing] run scoreboard players set @s gold 0

# Mark for removal (if in game)
$tag @p[nbt={UUID:$(UUID)}] add removing

# Skip turn if they were taking one
execute if entity @p[tag=removing,tag=taking_turn] run function mineparty:game/round/turn/skip

# Add temporary not_playing tag
tag @p[tag=removing] add not_playing
tag @p[tag=removing] add temp_not_playing

# Remove leftover tags and scores from possible previous games
tag @p[tag=removing] remove taking_turn
tag @p[tag=removing] remove moving
tag @p[tag=removing] remove dice_potion
tag @p[tag=removing] remove player
tag @p[tag=removing] remove ready
tag @p[tag=removing] remove highest
tag @p[tag=removing] add rolled_dice
execute as @p[tag=removing] run trigger mineparty_custom_trigger set -1
scoreboard players reset @p[tag=removing] mineparty_rank

# Clear items and gold
scoreboard players set @p[tag=removing] gold 0
clear @p[tag=removing] *[custom_data~{dice:true}]
clear @p[tag=removing] *[custom_data~{game_item:true}]
clear @p[tag=removing] gold_ingot
clear @p[tag=removing] diamond

# Clear scores
scoreboard players reset @p[tag=removing] minigames
scoreboard players reset @p[tag=removing] minigames_teams
scoreboard players reset @p[tag=removing] minigames_rank

# Update player count
execute store result score player_count mineparty if entity @a[tag=player]

# Clear effects
effect clear @p[tag=removing]

# Spectate host
gamemode spectator @p[tag=removing,tag=!host]
tp @p[tag=removing] @p[tag=host]

# Notify host
execute if entity @p[tag=removing] run tellraw @a[tag=host] [{"color":"light_purple","text":""},{"selector":"@p[tag=removing]"}," was removed from the game."]

# Clean up
tag @a remove removing