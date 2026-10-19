# Child function of updraft/mace_smash (needs player tagged "self")
# Executed as resource breaking
# Needs $(block_state) and $(value)

# Add score
$scoreboard players add @p[tag=self] minigames $(value)

# Crumble!
$execute at @n[tag=hit,tag=updraft_hitbox] run particle block{block_state:"$(block_state)"} ~ ~ ~ 0.4 0.4 0.4 0 128 normal

# Notify player
$title @p[tag=self] actionbar {"color":"gold","text":"+$(value) Points!"}

# Summon replacement
$function mineparty:minigames/minigames/updraft/summon/resource {resource:"$(resource)"}