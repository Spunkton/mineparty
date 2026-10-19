# Updates entire scoreboard

# Schedule self (every 5 seconds)
schedule function mineparty:game/scoreboard/update 5s replace

# Cancel if playing minigame
execute if data storage mineparty:main playing_minigame run return fail

# Reset everything
scoreboard players reset * mineparty_score

# Set display thingies scores
scoreboard players set %divider mineparty_score -2
scoreboard players set %round mineparty_score -3

# Setup bottom info
scoreboard players display name %divider mineparty_score "§7==========================="
scoreboard players display numberformat %divider mineparty_score fixed ""
scoreboard players display name %round mineparty_score "Round:"
scoreboard players display numberformat %round mineparty_score fixed ["\u00a7l[",{"color":"gold","score":{"name":"round","objective":"mineparty"}}," / ",{"color":"gold","score":{"name":"max_rounds","objective":"mineparty"}},"\u00a7l]"]

# Set diamond-gold total
execute as @a[tag=!not_playing,tag=player] run scoreboard players operation @s mineparty_score = @s diamond
execute as @a[tag=!not_playing,tag=player] run function mineparty:other/calc/mult {input:"@s mineparty_score",amount:10000}
execute as @a[tag=!not_playing,tag=player] run scoreboard players operation @s mineparty_score += @s gold
execute as @a[tag=!not_playing,tag=player] run scoreboard players display numberformat @s mineparty_score fixed ["\u00a7l[",{"color":"aqua","score":{"name":"@s","objective":"diamond"}},"\u00a7l - ",{"color":"gold","score":{"name":"@s","objective":"gold"}},"\u00a7l]"]

# Set scores (and score style)
execute as @a[tag=!not_playing,tag=player] at @s run function mineparty:game/scoreboard/rank
execute as @a[tag=!not_playing,tag=player] run function mineparty:game/scoreboard/style with entity @s

# Show rank under name
execute as @a[tag=!not_playing,tag=player] run function mineparty:game/scoreboard/leader