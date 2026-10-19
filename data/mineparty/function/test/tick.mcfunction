#tag @e[type=interaction,tag=test_interaction] remove looked_at
#execute as @e[type=interaction,tag=test_interaction] run function mineparty:test
#
#execute as @e[type=interaction,tag=looked_at,tag=!still_looked_at] run function mineparty:test/update
#execute as @e[type=interaction,tag=!looked_at,tag=still_looked_at] run function mineparty:test/update
#
#tag @e[type=interaction,tag=!looked_at,tag=still_looked_at] remove still_looked_at
#tag @e[type=interaction,tag=looked_at] add still_looked_at
