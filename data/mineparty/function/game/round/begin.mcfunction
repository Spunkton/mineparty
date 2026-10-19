# Add round to the counter
scoreboard players add round mineparty 1

# Cool effect
scoreboard players operation target_time mineparty = round mineparty
function mineparty:other/calc/mult {input:"target_time mineparty",amount:6000}
function mineparty:other/calc/mod {input:"target_time mineparty",amount:24000}
function mineparty:music/play {song:round}

# Title everyone
title @a title ["\u00a76Round ",{"score":{"name":"round","objective":"mineparty"}}]
# If last round
execute if score round mineparty = max_rounds mineparty run title @a title "\u00a74FINAL ROUND"