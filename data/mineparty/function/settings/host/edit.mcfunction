# Executed as host
# Edits settings from dialog
# Needs $(latecomers), $(allow_drop), $(afk_kick), $(sideliner_share), and $(debug_mode)

# Edit from input
$data modify storage mineparty:main settings[].latecomers set value "$(latecomers)"
$data modify storage mineparty:main settings[].allow_drop set value "$(allow_drop)"
$data modify storage mineparty:main settings[].afk_kick set value $(afk_kick)b
$data modify storage mineparty:main settings[].sideliner_share set value $(sideliner_share)b


# Edit host debug tag status
$execute if function $(debug_mode) run tag @s add debug
$execute unless function $(debug_mode) run tag @s remove debug
