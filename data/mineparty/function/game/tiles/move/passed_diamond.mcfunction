# Executed as and at player that landed on the diamond tile

# Pause movement
function mineparty:game/tiles/move/pause

# Actionbar
title @p[tag=will_continue] actionbar "\u00a7bYou passed the diamond tile!"

# Let the helper speak
execute as @p[tag=will_continue] at @s unless score @s gold >= #diamond_price mineparty run function mineparty:game/tiles/diamond/buy/cant_afford
execute as @p[tag=will_continue] at @s if score @s gold >= #diamond_price mineparty run function mineparty:game/tiles/diamond/buy/can_afford