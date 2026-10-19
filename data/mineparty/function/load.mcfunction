# Scoreboard setup
scoreboard objectives add dice_roll dummy "Dice Roll"
scoreboard objectives add gold dummy "\u00a76Gold Count"
scoreboard objectives add diamond dummy "\u00a7bDiamond Count"
scoreboard objectives add mineparty_score dummy [{"color":"#FF0000","text":"="},{"color":"#FF3500","text":"="},{"color":"#FF6A00","text":"="},{"color":"#FF9F00","text":"="},{"color":"#FFD500","text":"{"},{"color":"#F4FF00","text":"M"},{"color":"#BFFF00","text":"i"},{"color":"#8AFF00","text":"n"},{"color":"#55FF00","text":"e "},{"color":"#20FF00","text":"P"},{"color":"#00FF15","text":"a"},{"color":"#00FF4A","text":"r"},{"color":"#00FF80","text":"t"},{"color":"#00FFB5","text":"y "},{"color":"#00FFEA","text":"S"},{"color":"#00DFFF","text":"c"},{"color":"#00AAFF","text":"o"},{"color":"#0075FF","text":"r"},{"color":"#0040FF","text":"e"},{"color":"#000BFF","text":"}"},{"color":"#2B00FF","text":"="},{"color":"#6000FF","text":"="},{"color":"#9500FF","text":"="},{"color":"#FF00FF","text":"="}]
scoreboard objectives add mineparty dummy "\u00a7lMine Party!"
scoreboard objectives add mineparty_rank dummy ""
scoreboard objectives add minigames dummy
scoreboard objectives add minigames_teams dummy {"color":"gold","bold":true,"text":"Score"}
scoreboard objectives add minigames_rank dummy
scoreboard objectives add raycast dummy
scoreboard objectives add helper trigger
scoreboard objectives add mineparty_custom_trigger trigger
scoreboard objectives add ready trigger
scoreboard objectives add settings trigger
scoreboard objectives add left minecraft.custom:minecraft.leave_game
#scoreboard objectives add respawn_time minecraft.custom:minecraft.time_since_death

# Scores
execute unless score pause mineparty matches 0..1 run scoreboard players set pause mineparty 0
execute unless score max_rounds mineparty matches 0.. run scoreboard players set max_rounds mineparty 10
execute unless score #diamond_price mineparty matches 0.. run scoreboard players set #diamond_price mineparty 20

# Teams
team add no_collision
team modify no_collision collisionRule never
team modify no_collision friendlyFire false
team modify no_collision seeFriendlyInvisibles false
team add Blue {"color":"aqua","text":"Blue"}
team add Pink {"color":"light_purple","text":"Pink"}
team modify Blue color aqua
team modify Pink color light_purple

# Storage setup
function mineparty:load/quips
function mineparty:load/minigame_list
function mineparty:load/map_defaults
function mineparty:load/enum_check

# Set spawn location
kill @e[type=marker,tag=world_spawn]
summon marker ~ ~ ~ {Tags:["world_spawn"]}

# Notify
tellraw @a[gamemode=creative] "Mineparty reloaded!"