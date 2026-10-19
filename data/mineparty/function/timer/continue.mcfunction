# Tick down
execute store result bossbar mineparty:timer value if score timer mineparty matches 1.. run scoreboard players remove timer mineparty 1
execute if score timer mineparty matches 1.. run schedule function mineparty:timer/continue 1s

# Shows timer
scoreboard players operation #timer_seconds mineparty = timer mineparty
scoreboard players operation #timer_minutes mineparty = timer mineparty
function mineparty:other/calc/mod {input:"#timer_seconds mineparty",amount:60}
function mineparty:other/calc/div {input:"#timer_minutes mineparty",amount:60}

execute if score timer mineparty matches 1.. if score #timer_seconds mineparty matches 0..9 run bossbar set mineparty:timer name ["",{"color":"white","score":{"name":"#timer_minutes","objective":"mineparty"}},{"color":"gray","text":":"},{"color":"white","text":"0"},{"color":"white","score":{"name":"#timer_seconds","objective":"mineparty"}}]
execute if score timer mineparty matches 1.. unless score #timer_seconds mineparty matches 0..9 run bossbar set mineparty:timer name ["",{"color":"white","score":{"name":"#timer_minutes","objective":"mineparty"}},{"color":"gray","text":":"},{"color":"white","score":{"name":"#timer_seconds","objective":"mineparty"}}]

# Final x seconds
execute if score timer mineparty matches 10..10 run title @a subtitle "10 seconds remaining"
execute if score timer mineparty matches 10..10 run title @a title ""
execute if score timer mineparty matches 10..10 run bossbar set mineparty:timer color yellow

execute if score timer mineparty matches 1..3 run title @a subtitle {"color":"white","score":{"name":"timer","objective":"mineparty"}}
execute if score timer mineparty matches 1..3 run title @a title ""
execute if score timer mineparty matches 1..3 run bossbar set mineparty:timer color red

execute if score timer mineparty matches ..0 run title @a subtitle ""


# Runs function defined at start if ended
execute if score timer mineparty matches ..0 run title @a actionbar ""
execute if score timer mineparty matches ..0 run bossbar remove mineparty:timer
execute if score timer mineparty matches ..0 run function mineparty:command with storage mineparty:main timer