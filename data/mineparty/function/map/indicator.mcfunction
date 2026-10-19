# Show and remove tile indicators

# Clear tags
#tag @e[type=marker,tag=tile] remove position
tag @e[type=marker,tag=tile] remove occupied

# Check if player is editing map (a LOT more indicators)
execute if entity @a[predicate=mineparty:editor/holding_tool] run function mineparty:map/editing
execute unless entity @p[predicate=mineparty:editor/holding_tool] run kill @e[tag=editor_indicator]

# Add tags by requirement
#execute if data storage mineparty:main playing_game as @a at @s if entity @n[tag=tile,distance=..7] run tag @n[tag=tile] add position
execute as @e[type=marker,tag=tile] if data entity @s data.occupied[] run tag @s add occupied

# Add indicators if tag
#execute as @e[tag=position_indicator] at @s unless entity @n[tag=tile,tag=position,distance=..3] at @e[tag=tile,tag=position] unless entity @n[tag=position_indicator,distance=..3] run tp @s ~ ~ ~
#execute as @e[type=marker,tag=tile,tag=position] at @s unless entity @n[tag=position_indicator,distance=..3] run function mineparty:map/indicator/position
execute as @e[type=marker,tag=tile,tag=occupied] at @s unless entity @n[tag=occupied_indicator,distance=..3] run function mineparty:map/indicator/occupied
execute as @e[type=marker,tag=tile,tag=diamond] at @s unless entity @n[tag=diamond_indicator,distance=..3] run function mineparty:map/indicator/diamond

# Remove indicators if no tag
#execute as @e[tag=position_indicator] at @s unless entity @n[tag=tile,tag=position,distance=..3] run kill @s
execute as @e[tag=occupied_indicator] at @s unless entity @n[tag=tile,tag=occupied,distance=..3] run kill @s
### Property indicators
execute as @e[type=marker,tag=tile,tag=!diamond] at @s run kill @e[tag=diamond_indicator,tag=!transit,distance=..3]

# Rotate diamond indicators
execute as @e[tag=main_diamond,tag=!transit] at @s run tp @s ~ ~ ~ ~-0.5 ~
execute as @e[tag=orbit,tag=clockwise,tag=!transit] at @s run tp @s ~ ~ ~ ~5 ~
execute as @e[tag=orbit,tag=counter,tag=!transit] at @s run tp @s ~ ~ ~ ~-3 ~

# Kill indicators if updated
execute as @e[type=marker,tag=tile,tag=update] at @s run kill @e[tag=tile_indicator,distance=..3,tag=!position_indicator]
execute unless entity @n[tag=tile,tag=!update] run kill @e[tag=tile_indicator]

# Kill leftover indicators
execute as @e[tag=tile_indicator,tag=!transit] at @s unless entity @n[tag=tile,distance=..3] run kill @s