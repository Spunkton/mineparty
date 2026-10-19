# Extra time
function mineparty:timer/start {sec:60,command:"function mineparty:minigames/minigames/sulfurball/end"}

# Notify everyone
title @a title ""
title @a subtitle {"color":"gold","text":"OVERTIME"}
tellraw @a {"color":"gold","text":"Golden goal: Whoever scores first wins!"}
function mineparty:minigames/minigames/sulfurball/golden_goal/update_scoreboard