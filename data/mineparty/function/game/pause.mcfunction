# Remove advancement (can be called from advancement)
advancement revoke @s only mineparty:game/pause

# Pauses/unpauses game

# Cancel if no the host
execute unless entity @s[tag=host] run tellraw @a[tag=host] [{"color":"light_purple","text":""},{"selector":"@s"}," is requesting a pause."]
execute unless entity @s[tag=host] run tellraw @s "\u00a7cOnly hosts can pause the game."
execute unless entity @s[tag=host] run return 0

# Change pause status
execute if score pause mineparty matches 1 run scoreboard players set pause mineparty 2
execute if score pause mineparty matches 0 run scoreboard players set pause mineparty 1
execute if score pause mineparty matches 2 run scoreboard players set pause mineparty 0

# Pauses game with tick freeze
execute if score pause mineparty matches 1 run function mineparty:game/pause/freeze
execute if score pause mineparty matches 1 run title @a title "\u00a76GAME PAUSED"

# Unpauses game
execute if score pause mineparty matches 0 run function mineparty:game/pause/unfreeze
execute if score pause mineparty matches 0 run title @a title ""
execute if score pause mineparty matches 0 run title @a subtitle "\u00a76Game unpaused"

# Reenable trigger to unpause
execute if score pause mineparty matches 1 run give @s brick[consumable={consume_seconds:0,sound:"ui.button.click",has_consume_particles:false},custom_data={unpause:true},item_name={"color":"aqua","italic":false,"text":"Unpause Button"},item_model="player_head",profile={"properties":[{"name":"textures","value":"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvMzgyYzJmNmNlY2E4YzhmYjhjZDFiNjMwNmFkZTQ4MzA3YzQwZGJlMzlmOTQ2Nzg2NzhhOWIyMjMxZTRhNzE0ZCJ9fX0="}]}] 1
execute if score pause mineparty matches 0 run clear @a *[custom_data~{unpause:true}]
kill @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{unpause:true}}}}]

# Schedule fail message
execute if score pause mineparty matches 1 run schedule function mineparty:game/pause/fail 2t
execute if score pause mineparty matches 0 run schedule clear mineparty:game/pause/fail