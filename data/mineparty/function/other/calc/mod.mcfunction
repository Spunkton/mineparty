# Needs $(input) score and $(amount)
# Copy this: function mineparty:other/calc/mod {amount:n,input:"[name] [objective]"}
$scoreboard players set #mod mineparty $(amount)
$return run scoreboard players operation $(input) %= #mod mineparty