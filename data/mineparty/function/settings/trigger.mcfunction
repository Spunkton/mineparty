# Executes function based on trigger
# Executed as and at player who triggered
# Stores settings per digit
# Last digit is 1 to signify change in settings

# Multiply by -1
function mineparty:other/calc/mult {amount:-1,input:"@s settings"}

# If trigger is none or <0
execute if score @s settings matches -1 run function mineparty:settings/settings
execute unless score @s settings matches 1.. run scoreboard players set @s settings 0
execute if score @s settings matches ..0 run return 1

# Create temp scoreboard
scoreboard objectives add settings_calc dummy

# Calculate digits
### Set equal to trigger
scoreboard players operation no_music settings_calc = @s settings
scoreboard players operation no_die_at_roll settings_calc = @s settings
scoreboard players operation not_playing settings_calc = @s settings
scoreboard players operation no_flashing_imagery settings_calc = @s settings
### Calculate digit
function mineparty:other/calc/div {amount:10,input:"no_music settings_calc"}
function mineparty:other/calc/div {amount:100,input:"no_die_at_roll settings_calc"}
function mineparty:other/calc/div {amount:1000,input:"not_playing settings_calc"}
function mineparty:other/calc/div {amount:10000,input:"no_flashing_imagery settings_calc"}

function mineparty:other/calc/mod {amount:10,input:"* settings_calc"}

# Execute based on digits
### Digit 1: Mute music & sfx
execute if score no_music settings_calc matches 0 run tag @s remove no_music
execute if score no_music settings_calc matches 1 if entity @s[tag=!no_music] run tellraw @s "Turned off music and jingles! If you wanted to reduce volume, all music and jingles go through the \"Jukebox/Note blocks\" channel, so you can reduce volume there."
execute if score no_music settings_calc matches 1 run tag @s add no_music
### Digit 2: Automatically get die when you have to roll
execute if score no_die_at_roll settings_calc matches 0 run tag @s remove no_die_at_roll
execute if score no_die_at_roll settings_calc matches 1 run tag @s add no_die_at_roll
### Digit 3: Set self as non-playing
execute if score not_playing settings_calc matches 0 if data storage mineparty:main playing_game if entity @s[tag=not_playing] run tellraw @s "\u00a7cCannot change play status mid-game"
execute if score not_playing settings_calc matches 0 unless data storage mineparty:main playing_game run tag @s remove not_playing
execute if score not_playing settings_calc matches 1 if data storage mineparty:main playing_game if entity @s[tag=!not_playing] run tellraw @s "\u00a7cCannot change play status mid-game"
execute if score not_playing settings_calc matches 1 unless data storage mineparty:main playing_game run tag @s add not_playing
### Digit 4: Automatically get die when you have to roll
execute if score no_flashing_imagery settings_calc matches 0 run tag @s remove no_flashing_imagery
execute if score no_flashing_imagery settings_calc matches 1 run tag @s add no_flashing_imagery

# Reset scoreboards
scoreboard players set @s settings 0
scoreboard objectives remove settings_calc

# Notify
tellraw @s {"color":"gray","text":"Settings saved!"}