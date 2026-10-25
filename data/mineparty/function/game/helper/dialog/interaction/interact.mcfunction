# Executed as player interacting

# Cancel if not playing
execute unless data storage mineparty:main playing_game run title @s actionbar "<Helper> I'm on a break now, get to me when you start playing again!"
execute unless data storage mineparty:main playing_game at @n[tag=helper] run playsound minecraft:entity.allay.item_given neutral @s ~ ~ ~ 0.5
execute unless data storage mineparty:main playing_game at @n[tag=helper] run particle note ~ ~1 ~ 0.1 0 0 3.5 0 normal
execute unless data storage mineparty:main playing_game run return 0

# Roll random response
execute store result score #helper_dialog mineparty run random value 0..90

# Advancement
advancement grant @a only mineparty:mineparty/talk_to_helper

# Response
execute if score #helper_dialog mineparty matches 0..9 run title @s actionbar "<Helper> What can I help you with?"
execute if score #helper_dialog mineparty matches 10..19 run title @s actionbar "<Helper> Wassup?"
execute if score #helper_dialog mineparty matches 20..29 run title @s actionbar "<Helper> How can I help you?"
execute if score #helper_dialog mineparty matches 30..39 run title @s actionbar "<Helper> Need help?"
execute if score #helper_dialog mineparty matches 40..49 run title @s actionbar "<Helper> I gotchu fam no biggie"
execute if score #helper_dialog mineparty matches 50..54 run title @s actionbar "<Helper> Watashiwassup?"
execute if score #helper_dialog mineparty matches 55..64 run title @s actionbar "<Helper> You need me?"
execute if score #helper_dialog mineparty matches 65..74 run title @s actionbar "<Helper> Anything wrong?"
execute if score #helper_dialog mineparty matches 75..89 run title @s actionbar "<Helper> Here to help!"
execute if score #helper_dialog mineparty matches 90 run title @s actionbar "<Helper> I miss my wife."

# Sound effect
execute at @n[tag=helper] run playsound minecraft:entity.allay.item_given neutral @s ~ ~ ~ 0.5

# Particle
execute at @n[tag=helper] run particle note ~ ~1 ~ 0.1 0 0 7.5 0 normal

# Helper menu
tellraw @s [{"color":"white","text":"\u00a7l========{Helper menu (1/2)}========"},{"color":"#9CFCFF","italic":false,"text":"\n█"},{"color":"#80FCFF","text":"███"},{"color":"#9CFCFF","text":"█"},{"bold":false,"click_event":{"action":"run_command","command":"trigger helper set 11"},"color":"red","shadow_color":16777215,"text":" > [Pause/ request pause]"},{"color":"#64FBFF","text":"\n█"},{"color":"#3DE0F7","text":"███"},{"color":"#64FBFF","text":"█"},{"bold":false,"click_event":{"action":"run_command","command":"trigger helper set 2"},"color":"gold","shadow_color":16777215,"text":" > [Resend chat buttons]"},{"color":"#3DE0F7","text":"\n█"},{"color":"#FFFFFF","text":"█"},{"color":"#3DE0F7","text":"█"},{"color":"#FFFFFF","text":"█"},{"color":"#3DE0F7","text":"█"},{"bold":false,"click_event":{"action":"run_command","command":"trigger helper set 3"},"color":"yellow","shadow_color":16777215,"text":" > [Teleport back to tile]"},{"color":"#4CE9FF","text":"\n█"},{"color":"#FFFFFF","text":"█"},{"color":"#4CE9FF","text":"█"},{"color":"#FFFFFF","text":"█"},{"color":"#4CE9FF","text":"█"},{"bold":false,"click_event":{"action":"run_command","command":"trigger helper set 4"},"color":"green","shadow_color":16777215,"text":" > [Get default die]"},{"color":"#2CD5EC","text":"\n█"},{"color":"#3DE0F7","text":"███"},{"color":"#2CD5EC","text":"█"},{"bold":false,"click_event":{"action":"run_command","command":"trigger helper set 5"},"color":"aqua","shadow_color":16777215,"text":" > [Next page]"}]
tellraw @s ["",{"bold":true,"text":"=============={Info}=============="},{"color":"aqua","text":"\nDiamond Price: "},{"color":"gold","score":{"name":"#diamond_price","objective":"mineparty"}},{"color":"gold","text":" gold"},{"text":"\nRound: ["},{"color":"gold","score":{"name":"round","objective":"mineparty"}}," / ",{"color":"gold","score":{"name":"max_rounds","objective":"mineparty"}},{"text":"]\n"},{"bold":true,"text":"================================="}]