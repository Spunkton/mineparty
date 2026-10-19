# Needs $(sec) and $(command)

# Mark as unpaused
scoreboard players set #timer_paused mineparty 0

# Make bossbar
bossbar remove mineparty:timer
bossbar add mineparty:timer {"text":"timer"}
bossbar set mineparty:timer color green
bossbar set mineparty:timer players @a
bossbar set mineparty:timer style notched_20

# Set timer
$execute store result bossbar mineparty:timer max run scoreboard players set timer mineparty $(sec)
scoreboard players add timer mineparty 1
function mineparty:timer/continue

# Set command
$data modify storage mineparty:main timer.command set value "$(command)"
