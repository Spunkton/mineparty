# Makes latecomer play minigames, without putting them on the playing board or scoreboard.
# Executed as latecomer
# Needs $(map)

# Fail if already a sideliner
execute if entity @s[tag=!not_playing,tag=!player] run tellraw @a[tag=host] [{"color":"red","text":""},{"selector":"@s"}," is already a sideliner."]
execute if entity @s[tag=!not_playing,tag=!player] run return fail

# Cancel if minigame is ongoing
execute if data storage mineparty:main playing_minigame run tellraw @p[tag=host] {"color":"red","text":"Minigame is currently ongoing."}
execute if data storage mineparty:main playing_minigame run return fail

# Remove not_playing tag and player tag
tag @s remove not_playing
tag @s remove player
tag @s remove temp_not_playing

# Give 10 starting gold (if they have no gold)
execute unless items entity @s player minecraft:gold_ingot run function mineparty:game/items/gold/give {amount:10}

# Clear game items (they won't need them)
clear @s *[custom_data~{game_item:true}]
clear @s *[custom_data~{dice:true}]

# Remove occupied tile
function mineparty:game/tiles/remove_occupation with entity @s

# Remove from turn order
function mineparty:game/start/turn_order/remove with entity @s

# Update player count
execute store result score player_count mineparty if entity @a[tag=player]

# TP to starting tile
$execute at @n[nbt={data:{map:"$(map)"}},tag=start,sort=random] run tp @s ~ ~ ~

# Adventure mode
gamemode adventure @s

# Notify
tellraw @s "You have been sidelined for now. You may still play minigames, but you aren't on the board."
tellraw @a[tag=host] [{"color":"light_purple","text":""},{"selector":"@s"}," has been sidelined."]