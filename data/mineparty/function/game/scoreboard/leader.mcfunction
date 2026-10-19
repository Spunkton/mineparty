# Shows rank under name

execute if score @s mineparty_rank matches ..1 run scoreboard players display numberformat @s mineparty_rank fixed [" ",{"color":"gold","text":"★ 1st ★"}]
execute if score @s mineparty_rank matches 2 run scoreboard players display numberformat @s mineparty_rank fixed [" ",{"color":"#C4F5FF","text":"2nd"}]
execute if score @s mineparty_rank matches 3 run scoreboard players display numberformat @s mineparty_rank fixed [" ",{"color":"#FF802B","text":"3rd"}]
execute if score @s mineparty_rank matches 4.. run scoreboard players display numberformat @s mineparty_rank
execute if score @s mineparty_rank matches 4.. run scoreboard players display numberformat @s mineparty_rank fixed [" ",{"score":{"name":"@s","objective":"mineparty_rank"}},"th"]