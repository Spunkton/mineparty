# Just random occurrences

# RNG
execute store result score #shenanigans mineparty run random value 0..999

# Helper speaks (1/10 chance)
execute if score #shenanigans mineparty matches 0..99 run function mineparty:game/round/turn/shenanigans/helper_quip