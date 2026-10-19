#Rainbow title

#Modulo
scoreboard players operation #minigame_title_mod mineparty = #minigame_title mineparty
function mineparty:other/calc/mod {input:"#minigame_title_mod mineparty",amount:6}

#Title itself
execute if score #minigame_title_mod mineparty matches 0 run title @a title [{"bold":true,"color":"red","text":"M"},{"bold":true,"color":"gold","text":"I"},{"bold":true,"color":"yellow","text":"N"},{"bold":true,"color":"green","text":"I"},{"bold":true,"color":"aqua","text":"G"},{"bold":true,"color":"light_purple","text":"A"},{"bold":true,"color":"red","text":"M"},{"bold":true,"color":"gold","text":"E"}]
execute if score #minigame_title_mod mineparty matches 1 run title @a title [{"bold":true,"color":"light_purple","text":"M"},{"bold":true,"color":"red","text":"I"},{"bold":true,"color":"gold","text":"N"},{"bold":true,"color":"yellow","text":"I"},{"bold":true,"color":"green","text":"G"},{"bold":true,"color":"aqua","text":"A"},{"bold":true,"color":"light_purple","text":"M"},{"bold":true,"color":"red","text":"E"}]
execute if score #minigame_title_mod mineparty matches 2 run title @a title [{"bold":true,"color":"aqua","text":"M"},{"bold":true,"color":"light_purple","text":"I"},{"bold":true,"color":"red","text":"N"},{"bold":true,"color":"gold","text":"I"},{"bold":true,"color":"yellow","text":"G"},{"bold":true,"color":"green","text":"A"},{"bold":true,"color":"aqua","text":"M"},{"bold":true,"color":"light_purple","text":"E"}]
execute if score #minigame_title_mod mineparty matches 3 run title @a title [{"bold":true,"color":"green","text":"M"},{"bold":true,"color":"aqua","text":"I"},{"bold":true,"color":"light_purple","text":"N"},{"bold":true,"color":"red","text":"I"},{"bold":true,"color":"gold","text":"G"},{"bold":true,"color":"yellow","text":"A"},{"bold":true,"color":"green","text":"M"},{"bold":true,"color":"aqua","text":"E"}]
execute if score #minigame_title_mod mineparty matches 4 run title @a title [{"bold":true,"color":"yellow","text":"M"},{"bold":true,"color":"green","text":"I"},{"bold":true,"color":"aqua","text":"N"},{"bold":true,"color":"light_purple","text":"I"},{"bold":true,"color":"red","text":"G"},{"bold":true,"color":"gold","text":"A"},{"bold":true,"color":"yellow","text":"M"},{"bold":true,"color":"green","text":"E"}]
execute if score #minigame_title_mod mineparty matches 5 run title @a title [{"bold":true,"color":"gold","text":"M"},{"bold":true,"color":"yellow","text":"I"},{"bold":true,"color":"green","text":"N"},{"bold":true,"color":"aqua","text":"I"},{"bold":true,"color":"light_purple","text":"G"},{"bold":true,"color":"red","text":"A"},{"bold":true,"color":"gold","text":"M"},{"bold":true,"color":"yellow","text":"E"}]

#Subtitle
execute if score #minigame_title_mod mineparty matches 0..2 run title @a subtitle {"color":"red","interpret":true,"nbt":"minigame.subtitle","storage":"mineparty:main"}
execute if score #minigame_title_mod mineparty matches 3..5 run title @a subtitle {"color":"white","interpret":true,"nbt":"minigame.subtitle","storage":"mineparty:main"}

#Ticking down
scoreboard players remove #minigame_title mineparty 1
execute if score #minigame_title mineparty matches 1.. run schedule function mineparty:game/minigames/title/loop 2t
execute if score #minigame_title mineparty matches ..0 run title @a reset