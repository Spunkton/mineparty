# Tag definitions
# comp      -   Competitive, this is the default tag a standard Mine Party game pulls from.
# coop      -   Cooperative, this is where the future coop version will pull from.
# ffa       -   Free for all, every player for themselves.
# team      -   Players are split into (usually 2) teams.
# 1vall     -   One player is pitted against all other players.
# duel      -   Able to be played as a duel (most comp minigames fall into this). Duels draw from this tag.
# luck      -   Luck based, you can filter these out if you don't like them.
# hard_cap  -   Has a hard limit on how many players can play. Input in "extra:{hard_cap:n}" how high the limit is.
# soft_cap  -   Might be significantly less fun/ tedious/ unbalanced if too many players participate.


# List that defines used minigames

# Reset list
data modify storage mineparty:main minigames.available set value []

# Add minigames with tags
data modify storage mineparty:main minigames.available append value {id:"no_way_but_up",tags:["ffa","comp","duel"],name:"No Way But Up",desc:"Ride the clouds in this parkour minigame!"}
data modify storage mineparty:main minigames.available append value {id:"pigment_perfect",tags:["ffa","comp","duel"],name:"Pigment Perfect",desc:"Test your eye for color in this game of precision"}
data modify storage mineparty:main minigames.available append value {id:"updraft",tags:["ffa","comp","duel"],name:"Updraft",desc:"Blast yourself upwards with perfectly timed mace smashes!"}
#data modify storage mineparty:main minigames.available append value {id:"skyloop",tags:["ffa"],name:"Skyloop"}
#data modify storage mineparty:main minigames.available append value {id:"turf_war",tags:["team"]}
#data modify storage mineparty:main minigames.available append value {id:"glass_bridge",tags:["ffa"]}
#data modify storage mineparty:main minigames.available append value {id:"dunks",tags:["team"]}
data modify storage mineparty:main minigames.available append value {id:"russian_roulette",tags:["ffa","luck","comp","duel","soft_cap"],name:"Russian Roulette",desc:"Let fate decide your survival"}
data modify storage mineparty:main minigames.available append value {id:"sulfurball",tags:["team","comp","duel"],name:"Sulfurball",desc:"Football if it was epic"}
#data modify storage mineparty:main minigames.available append value {id:"pumo",tags:["ffa"]}
#data modify storage mineparty:main minigames.available append value {id:"red_light_green_light",tags:["1vall"]}
#data modify storage mineparty:main minigames.available append value {id:"smash_bros",tags:["ffa"]}
#data modify storage mineparty:main minigames.available append value {id:"kosmos_fishing",tags:["ffa"]}
#data modify storage mineparty:main minigames.available append value {id:"the_fall",tags:["ffa"]}
#data modify storage mineparty:main minigames.available append value {id:"build_a_base",tags:["coop"]}
#data modify storage mineparty:main minigames.available append value {id:"snowballs",tags:["ffa"]}