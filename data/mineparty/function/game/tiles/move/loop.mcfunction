# Show current possible tiles to move to

# If moving player left (absentee)
execute unless entity @p[tag=moving] run function mineparty:game/player/absentee with storage mineparty:main turn
execute unless entity @p[tag=moving] run return fail

# If there are multiple moving players
execute as @p[tag=moving] at @s if entity @p[tag=moving,distance=.1..] run function mineparty:game/tiles/move/remove_dupes with storage mineparty:main turn


# Notify movecount
execute unless score #steps mineparty matches 1 run title @p[tag=moving] actionbar ["You have ",{"score":{"name":"#steps","objective":"mineparty"}}," more steps to go!"]
execute if score #steps mineparty matches 1 run title @p[tag=moving] actionbar ["You have only ",{"score":{"name":"#steps","objective":"mineparty"}}," more step to go!"]
### Info message about nearby tiles
execute as @p[tag=moving] at @s at @n[tag=tile,tag=!move_from] run function mineparty:game/tiles/move/info_message

# Add move_update tag
execute at @p[tag=moving,predicate=mineparty:on_ground] positioned ~-1.5 ~-1 ~-1.5 run tag @n[tag=tile,dx=2,dy=2,dz=2,tag=move_to,tag=!move_from,tag=!impassable] add move_update

# Clear tags
tag @e[type=marker,tag=tile] remove impassable

# Update when new tile is walked on
### Effects
execute at @n[tag=move_update] run playsound minecraft:block.amethyst_block.step block @a ~ ~ ~
execute at @n[tag=move_update] run particle minecraft:wax_on ~ ~.5 ~ 0.5 0 0.5 2 10
### Count steps down
execute at @n[tag=move_update] run scoreboard players remove #steps mineparty 1
### Clear old tags
execute as @n[tag=move_from] if entity @n[tag=move_update,distance=1..] run tag @e[tag=tile] remove move_past
execute as @n[tag=move_from] if entity @n[tag=move_update,distance=1..] run tag @s add move_past
execute as @n[tag=move_from] if entity @n[tag=move_update,distance=1..] run tag @s remove move_from
### If the link to the tile is special
execute if entity @n[tag=move_update,tag=special_link] run function mineparty:game/tiles/move/special_link with entity @n[tag=move_update,tag=special_link] data.temp.tile_check
### If it is a no-passage tile
execute unless score #steps mineparty matches ..0 if entity @n[tag=move_update,tag=no_passage] run tellraw @p[tag=moving] "\u00a7cLanded on an end tile! Ending turn..."
execute if entity @n[tag=move_update,tag=no_passage] run scoreboard players set #steps mineparty 0
### If it is a trapped tile
execute if data entity @n[tag=move_update] data.modifiers[{id:"poison"}] run function mineparty:game/items/evoker_trap/activate
### If it is a diamond tile
execute if entity @n[tag=move_update,tag=diamond] run function mineparty:game/tiles/move/passed_diamond
execute if entity @n[tag=continue_from,tag=diamond] run return 1
### Add move_to tag
execute if entity @n[tag=move_update] run function mineparty:game/tiles/move/update/move_to
### End update (!!!)
tag @n[tag=move_update] add move_from
tag @n[tag=move_update] remove move_update

# Set base amount for tile check
execute as @e[type=marker,tag=move_to] unless data entity @s data.temp.tile_check.amount run data modify entity @s data.temp.tile_check.amount set value 0

# Summon indicators
execute as @e[type=marker,tag=tile,tag=move_to] at @s unless entity @n[tag=move_to_indicator,distance=..3] run function mineparty:game/tiles/move/move_to_indicator

# Check for specialities on tiles
execute as @e[type=marker,tag=move_to] run data modify entity @s data.temp.tile_check.from set from entity @s data.links[0].UUID
execute as @e[type=marker,tag=move_to] run data modify entity @s data.temp.tile_check.to set from entity @s UUID
execute as @e[type=marker,tag=move_to] at @s run function mineparty:game/tiles/move/tile_check with entity @s data.temp.tile_check

# Remove indicators
execute as @e[type=marker,tag=tile,tag=!move_to] at @s run kill @e[tag=move_to_indicator,distance=..3]
execute as @e[type=item_display,tag=special_link_indicator] at @s unless entity @n[distance=..3,tag=tile,tag=special_link] run kill @s
tag @e[type=marker,tag=tile,tag=!move_to,tag=no_passage_temp] remove no_passage_temp

# If there is no way out
execute unless score #steps mineparty matches ..0 unless entity @n[tag=move_to,tag=!impassable] run tellraw @p[tag=moving] "\u00a7cDead end! Ending turn..."
execute unless entity @n[tag=move_to] run scoreboard players set #steps mineparty 0
execute unless entity @n[type=marker,tag=move_to,tag=!impassable] run scoreboard players set #steps mineparty 0

# Schedule self
execute unless score #steps mineparty matches ..0 run schedule function mineparty:game/tiles/move/loop 1t
execute if score #steps mineparty matches ..0 run function mineparty:game/tiles/move/finished