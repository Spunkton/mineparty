# Cancel if no diamond tile
execute unless entity @n[tag=diamond,tag=tile] run return fail

# Animation length (in ticks)
scoreboard players set #diamond_animation mineparty 101

# Remove the old indicators
kill @e[tag=diamond_indicator]
execute at @n[tag=diamond] run summon marker ~ ~ ~ {Tags:["diamond_indicator","placeholder"]}

# Start ticking
function mineparty:game/tiles/diamond/animation/tick