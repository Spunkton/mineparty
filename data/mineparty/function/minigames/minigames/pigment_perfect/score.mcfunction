# Executed as player scoring
# Score is the CIELAB distance of each armor piece to the reference added together

# Clear data
data modify storage mineparty:math distance.color.rgb_a set value [0,0,0]
data modify storage mineparty:math distance.color.rgb_b set value [0,0,0]
scoreboard players set @s minigames 0

# Setup results
data modify storage mineparty:math result set value {total:400f,head:100f,chest:150f,legs:150f,feet:100f,percentage:0}

# Tellraw divider
tellraw @s {"color":"green","text":"========={Your Scores}========="}

# Score pieces
function mineparty:minigames/minigames/pigment_perfect/score/piece {part:head,piece:helmet,display_name:Helmet}
function mineparty:minigames/minigames/pigment_perfect/score/piece {part:chest,piece:chestplate,display_name:Chestplate}
function mineparty:minigames/minigames/pigment_perfect/score/piece {part:legs,piece:leggings,display_name:Leggings}
function mineparty:minigames/minigames/pigment_perfect/score/piece {part:feet,piece:boots,display_name:Boots}

# Score total
data modify storage mineparty:math result.total set compute default float mineparty:minigames/pigment_perfect/total
execute store result score @s minigames run compute default float mineparty:minigames/pigment_perfect/total 100

# Tellraw divider
tellraw @s {"color":"green","text":"=========={Final Score}=========="}

# Compute total percentage
execute store result storage mineparty:math result.percentage int 1 run compute default float mineparty:minigames/pigment_perfect/total_percentage

# Show numbers
tellraw @s ["Score: ",{"storage":"mineparty:math","nbt":"result.percentage","hover_event":{"action":"show_text","value":["Average Δe = ",{"storage":"mineparty:math","nbt":"result.total"}]}},"%"]
