# Calculate half of teamless players
execute store result score #team_split mineparty if entity @a[team=,tag=!not_playing]
execute store result storage mineparty:main team_split int 1 run function mineparty:other/calc/div {input:"#team_split mineparty",amount:2}

execute store result score #team_split mineparty if entity @a[team=,tag=!not_playing]
function mineparty:other/calc/mod {input:"#team_split mineparty",amount:2}

# Send into teams
function mineparty:minigames/split_teams/join with storage mineparty:main
team join Pink @a[team=,tag=!not_playing]

# Give advantage in case inbalance
execute if score #team_split mineparty matches 1 run tag @r[team=Blue] add advantage