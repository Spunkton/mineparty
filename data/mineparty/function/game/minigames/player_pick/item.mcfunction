# Shows single clickable minigame option and sets the trigger
# Needs $(id), $(number), $(name), and $(desc)

# Show option
$tellraw @s [{"color":"aqua","text":"> ["},{"click_event":{"action":"run_command","command":"trigger mineparty_custom_trigger set $(number)"},"hover_event":{"action":"show_text","value":[{"text":"$(desc)"}]},"text":"$(name)"},"]"]

# Set launch trigger
$data modify storage mineparty:main custom_trigger append value "function mineparty:minigames/play {game:\"$(id)\"}"