# Needs $(resource)

# Summon marker for macro storage
execute at @n[tag=updraft_origin] run summon marker ~ ~ ~ {Tags:["updraft_summon_data"]}

# Rotate random amount
data modify entity @n[tag=updraft_summon_data] Rotation[0] set compute default float {type:"minecraft:uniform",min:-180,max:180}

# Set distance for block to spawn
data modify entity @n[tag=updraft_summon_data] data.distance set compute default float {type:"minecraft:sqrt",input:{type:"minecraft:uniform",min:0,max:133}}

# Set distance for block to spawn
data modify entity @n[tag=updraft_summon_data] data.height set compute default float {type:"minecraft:mul",inputs:[{type:"minecraft:uniform",min:-3,max:3},{type:"minecraft:uniform",min:-3,max:3}]}

# Summon resource
$function mineparty:minigames/minigames/updraft/summon/resource/$(resource) with entity @n[tag=updraft_summon_data] data

# Clean up
kill @n[tag=updraft_summon_data]