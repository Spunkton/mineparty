# Executed as player picking
# There should only be one player picking!!!!
# Needs $(tags)

# Disable custom trigger for others
scoreboard players set @a mineparty_custom_trigger -1
execute as @a run trigger mineparty_custom_trigger set -1
# Enable the custom trigger
scoreboard players enable @s mineparty_custom_trigger

# Clear the current custom trigger
data modify storage mineparty:main custom_trigger set value []

# Decor
tellraw @s "\u00a7l====={Pick a game!}====="
tellraw @a[distance=.1..] ["",{"selector":"@s"}," is selecting a minigame..."]

# First option
### Pick game with tags
$function mineparty:game/minigames/pick {tags:$(tags)}
### In case of missing data
execute unless data storage mineparty:main minigames.pick.name run data modify storage mineparty:main minigames.pick.name set from storage mineparty:main minigames.pick.id
execute unless data storage mineparty:main minigames.pick.desc run data modify storage mineparty:main minigames.pick.desc set value "\u00a73No description found."
### Set option number for the trigger
data modify storage mineparty:main minigames.pick.number set value 0
### Show option and set trigger
function mineparty:game/minigames/player_pick/item with storage mineparty:main minigames.pick

# Second option
### Pick game with tags
$function mineparty:game/minigames/pick {tags:$(tags)}
### In case of missing data
execute unless data storage mineparty:main minigames.pick.name run data modify storage mineparty:main minigames.pick.name set from storage mineparty:main minigames.pick.id
execute unless data storage mineparty:main minigames.pick.desc run data modify storage mineparty:main minigames.pick.desc set value "\u00a73No description found."
### Set option number for the trigger
data modify storage mineparty:main minigames.pick.number set value 1
### Show option and set trigger
function mineparty:game/minigames/player_pick/item with storage mineparty:main minigames.pick

# Third option
### Pick game with tags
$function mineparty:game/minigames/pick {tags:$(tags)}
### In case of missing data
execute unless data storage mineparty:main minigames.pick.name run data modify storage mineparty:main minigames.pick.name set from storage mineparty:main minigames.pick.id
execute unless data storage mineparty:main minigames.pick.desc run data modify storage mineparty:main minigames.pick.desc set value "\u00a73No description found."
### Set option number for the trigger
data modify storage mineparty:main minigames.pick.number set value 2
### Show option and set trigger
function mineparty:game/minigames/player_pick/item with storage mineparty:main minigames.pick

tellraw @s "========================="