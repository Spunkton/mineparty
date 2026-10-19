# Trigger that helps player change settings
scoreboard players enable @a settings
execute as @a unless score @s settings matches 0 run function mineparty:settings/trigger

# Host settings player selector
execute as @a[tag=host] if items entity @s weapon.mainhand *[custom_data~{host_settings:true}] unless predicate mineparty:sneaking at @s anchored eyes run function mineparty:settings/host/pointed