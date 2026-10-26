# Ends minigame without winners

# Stops schedule
schedule clear mineparty:minigames/minigames/pigment_perfect/clothing/feet
schedule clear mineparty:minigames/minigames/pigment_perfect/clothing/legs
schedule clear mineparty:minigames/minigames/pigment_perfect/clothing/chest
schedule clear mineparty:minigames/minigames/pigment_perfect/clothing/head
schedule clear mineparty:minigames/minigames/pigment_perfect/start/after_intro
schedule clear mineparty:minigames/minigames/pigment_perfect/tick
schedule clear mineparty:minigames/minigames/pigment_perfect/end
function mineparty:timer/cancel

# Remove teams
team leave @a[tag=!not_playing]

# Clean up