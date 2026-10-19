# Open player menu

# If sneaking
execute if predicate mineparty:sneaking run return run function mineparty:settings/host/player/menu

# If not sneaking
execute unless predicate mineparty:sneaking run function mineparty:settings/host/player/pointed