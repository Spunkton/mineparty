# Needs UUID
$execute if score @s mineparty_rank matches ..1 run scoreboard players display name @s mineparty_score ["",{"color":"gold","text":"1st"},"\u00a7a - ",{"player":{"id":$(UUID)}},"\u00a7a - ",{"selector":"@s"}]
$execute if score @s mineparty_rank matches 2 run scoreboard players display name @s mineparty_score ["",{"color":"#C4F5FF","text":"2nd"},"\u00a7a - ",{"player":{"id":$(UUID)}},"\u00a7a - ",{"selector":"@s"}]
$execute if score @s mineparty_rank matches 3 run scoreboard players display name @s mineparty_score ["",{"color":"#FF802B","text":"3rd"},"\u00a7a - ",{"player":{"id":$(UUID)}},"\u00a7a - ",{"selector":"@s"}]
execute if score @s mineparty_rank matches 4.. run scoreboard players display numberformat @s mineparty_rank
$execute if score @s mineparty_rank matches 4.. run scoreboard players display name @s mineparty_score [{"score":{"name":"@s","objective":"mineparty_rank"}},"th","\u00a7a - ",{"player":{"id":$(UUID)}},"\u00a7a - ",{"selector":"@s"}]