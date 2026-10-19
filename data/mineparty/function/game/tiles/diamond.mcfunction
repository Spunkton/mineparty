# Spawns the diamond incl. animations and sound effects
# Needs $(map)

# Tag the new diamond
$function mineparty:game/tiles/diamond/pick {map:"$(map)"}

# Start animation
function mineparty:game/tiles/diamond/animation

# Play sound
function mineparty:music/play {song:"tiles/diamond"}