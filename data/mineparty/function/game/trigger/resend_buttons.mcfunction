# Executed as player recieving chat buttons

# Check if player can trigger with mineparty_custom_trigger
execute store result score #fail_check mineparty run trigger mineparty_custom_trigger set -1

# Fail if not enabled (and not a host)
execute unless entity @s[tag=host] if score #fail_check mineparty matches 0 run tellraw @s {"color":"red","text":"There are no buttons to send right now."}
execute unless entity @s[tag=host] if score #fail_check mineparty matches 0 run return fail

# Reenable trigger
scoreboard players enable @s mineparty_custom_trigger

# Sound effect bc why not
execute at @s run playsound minecraft:entity.allay.item_given neutral @s ~ ~ ~ 1 2 1

# Pepper gotchu
tellraw @s {"color":"gray","text":"<Helper> Lemme check my notes..."}

# Resend buttons
function mineparty:tellraw with storage mineparty:main