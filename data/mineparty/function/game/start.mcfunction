# Needs $(map) and $(rounds)

# Cancel if game is already ongoing
execute if data storage mineparty:main playing_game run title @s actionbar "\u00a7cGame is already ongoing!"
execute if data storage mineparty:main playing_game run playsound minecraft:block.bell.use player @s
execute if data storage mineparty:main playing_game run tellraw @s "To force the current game to end, use \"/function mineparty:game/abort\"."
execute if data storage mineparty:main playing_game run return 0

# Cancel if there is no host
execute unless entity @p[tag=host] run title @s actionbar "\u00a7cYou need a host to start the game!"
execute unless entity @p[tag=host] run playsound minecraft:block.bell.use player @s
execute unless entity @p[tag=host] run tellraw @s "You need a host to start the game!\n> Use \"/tag @s add host\" to make yourself host."
execute unless entity @p[tag=host] run return 0

# Cancel if there are no players
execute unless entity @p[tag=!not_playing] run title @s actionbar "\u00a7cYou need players to start the game!"
execute unless entity @p[tag=!not_playing] run playsound minecraft:block.bell.use player @s
execute unless entity @p[tag=!not_playing] run tellraw @s "You need players to start the game!\n> Use \"/trigger settings set -1\" to open the settings menu and tag yourself as playing."
execute unless entity @p[tag=!not_playing] run return 0

# Cancel if map doesn't have a start
$execute unless entity @n[nbt={data:{map:"$(map)"}},tag=start] run title @s actionbar "\u00a7cMap (start) not found."
$execute unless entity @n[nbt={data:{map:"$(map)"}},tag=start] run playsound minecraft:block.bell.use player @s
$execute unless entity @n[nbt={data:{map:"$(map)"}},tag=start] run tellraw @s "The map either wasn't saved or doesn't have a start. \n> Use \"/function mineparty:editor/tools/start_marker\" to get the tool to mark the starting tile."
$execute unless entity @n[nbt={data:{map:"$(map)"}},tag=start] run return 0

# Give everybody the root advancement
advancement grant @a only mineparty:mineparty/root

# Clear schedules
schedule clear mineparty:game/dice/wait_for_roll
schedule clear mineparty:minigames/wait_for_ready
schedule clear mineparty:game/start/introduction
schedule clear mineparty:game/helper/dialog/line
schedule clear mineparty:command_queue
schedule clear mineparty:game/start/title_card/go_crazy
schedule clear mineparty:game/start/title_card/second_half
schedule clear mineparty:game/minigames/title/loop
schedule clear mineparty:game/round/turn/begin
function mineparty:game/tiles/move/cancel
function mineparty:minigames/abort
function mineparty:timer/abort

# Clear queues
data remove entity @n[tag=helper] data.queue
data remove entity @n[tag=helper] data.command

# Setup minigame list
data modify storage mineparty:main minigames.pool set from storage mineparty:main minigames.available

# Reset tags
tag @e[tag=tile] remove diamond
tag @a[tag=temp_not_playing] remove not_playing
tag @a remove temp_not_playing
tag @a[tag=!not_playing] add player

# Set up scoreboards
### Reset scores
scoreboard players reset * gold
scoreboard players set @a[tag=!not_playing] gold 0
scoreboard players reset * diamond
scoreboard players reset * mineparty_score
scoreboard players reset * left
execute as @a run trigger mineparty_custom_trigger set -1
### Set values
scoreboard players set @a diamond 0
scoreboard players set %divider mineparty_score -100000
scoreboard players set %round mineparty_score -100001
scoreboard players set round mineparty 0
$scoreboard players set max_rounds mineparty $(rounds)
scoreboard players set player_count mineparty 0
execute as @a[tag=!not_playing] run scoreboard players add player_count mineparty 1
scoreboard players set turn mineparty 0
scoreboard players remove turn mineparty 1
scoreboard players set target_time mineparty 0
### Update scoreboard (and start update loop)
function mineparty:game/scoreboard/update
### Show sidebar
scoreboard objectives setdisplay sidebar mineparty_score
scoreboard objectives setdisplay below_name mineparty_rank
scoreboard objectives setdisplay list mineparty_rank

# We're gaming now
data modify storage mineparty:main playing_game.mode set value "ffa"
$data modify storage mineparty:main playing_game.map set value "$(map)"

# Map data
$execute store result storage mineparty:main playing_game.details.minigame_prize int 1 run data get storage mineparty:maps maps.$(map).minigame_prize
$execute store result score #diamond_price mineparty run data get storage mineparty:maps maps.$(map).diamond_price

# Tp to start
$execute at @n[nbt={data:{map:"$(map)"}},tag=start,sort=random] run tp @a ~ ~ ~

# Clear occupation markers and set them all to starting tile
$execute as @e[tag=tile,nbt={data:{map:"$(map)"}}] run data modify entity @s data.occupied set value []
execute as @a[tag=!not_playing] at @s run function mineparty:game/tiles/occupy

# Set gamemode to adventure
gamemode adventure @a
gamemode spectator @a[tag=not_playing,tag=!host]

# Clear inventories
clear @a[tag=!not_playing] *[custom_data~{dice:true}]
clear @a[tag=!not_playing] *[custom_data~{game_item:true}]
clear @a[tag=!not_playing] gold_ingot
give @a[tag=!not_playing] gold_ingot 10
clear @a[tag=!not_playing] diamond
clear @a *[custom_data~{host_settings:true}]
execute as @a[tag=host] run function mineparty:settings/host/give

# Give host "taking_turn" tag temporarily
tag @a remove taking_turn
tag @p[tag=host,tag=!not_playing] add taking_turn
execute if entity @p[tag=host,tag=!not_playing] unless entity @p[tag=taking_turn] run tag @r[tag=!not_playing] add taking_turn

# Kill poor old helper to get shiny new helper
function mineparty:game/helper/follow
item replace entity @e[tag=helper] weapon.mainhand with air
kill @e[tag=helper]
execute at @p[tag=host] run summon ominous_item_spawner ~ ~5 ~ {spawn_item_after_ticks:100,item:{id:"minecraft:allay_spawn_egg",count:1,components:{"minecraft:custom_data":{helper:true}}}}
function mineparty:game/helper/wait_for_summon

# Notifications
tellraw @a[tag=host,tag=not_playing] "\u00a7eNon-playing host detected!"
execute as @a[tag=host] run tellraw @s [{"color":"light_purple","text":"Hello "},{"selector":"@s"},"! Thank you for hosting this game. Host prompts will be in light purple, like this message!"]

# Schedule introduction
schedule function mineparty:game/start/introduction 102t