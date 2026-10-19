# Same thing as timer/start, except with little effects and stuff so you know something happened
# Needs $(command) and $(sec)


# Run timer
$function mineparty:timer/start {command:"$(command)",sec:$(sec)}

# Notify
$tellraw @s {"color":"gray","text":"Timer has been set for $(sec) seconds with command \"$(command)\"."}

# Dinky ahh noises
playsound minecraft:block.note_block.bell player @s ~ ~ ~ 1 1.7