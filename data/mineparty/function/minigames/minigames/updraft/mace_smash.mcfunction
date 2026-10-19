advancement revoke @s only mineparty:minigames/updraft/mace_smash

# Tag self
tag @s add self

# Detect what entity was hit
execute as @e[tag=updraft_hitbox] at @s on attacker as @n[distance=...1] run tag @s add hit_candidate
execute as @n[tag=hit_candidate,tag=!attacked] run tag @s add hit
execute unless entity @n[tag=hit,tag=updraft_hitbox] as @n[tag=hit_candidate,tag=updraft_hitbox] run tag @s add hit

# Destroy!
execute as @n[tag=hit,tag=updraft_hitbox] at @s run function mineparty:minigames/minigames/updraft/mace_smash/break with entity @s data

# Nice little sound
execute at @n[tag=hit,tag=updraft_hitbox] run playsound minecraft:entity.arrow.hit_player player @s ~ ~ ~ 1 1

# Clean up
tag @s remove self
tag @e[tag=updraft_resource] remove hit_candidate
execute as @n[tag=hit,tag=updraft_hitbox] on passengers run kill @s
execute as @n[tag=hit,tag=updraft_hitbox] on vehicle run kill @s
kill @n[tag=hit,tag=updraft_hitbox]