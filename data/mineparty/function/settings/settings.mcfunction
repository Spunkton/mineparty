# Execute as player changing settings

execute if entity @s[tag=no_music] run data modify storage mineparty:main temp.settings.no_music set value "true"
execute unless entity @s[tag=no_music] run data modify storage mineparty:main temp.settings.no_music set value "false"
execute if entity @s[tag=no_die_at_roll] run data modify storage mineparty:main temp.settings.no_die_at_roll set value "true"
execute unless entity @s[tag=no_die_at_roll] run data modify storage mineparty:main temp.settings.no_die_at_roll set value "false"
execute if entity @s[tag=not_playing] run data modify storage mineparty:main temp.settings.not_playing set value "true"
execute unless entity @s[tag=not_playing] run data modify storage mineparty:main temp.settings.not_playing set value "false"
execute if entity @s[tag=no_flashing_imagery] run data modify storage mineparty:main temp.settings.no_flashing_imagery set value "true"
execute unless entity @s[tag=no_flashing_imagery] run data modify storage mineparty:main temp.settings.no_flashing_imagery set value "false"

# Open dialog
function mineparty:settings/dialog with storage mineparty:main temp.settings