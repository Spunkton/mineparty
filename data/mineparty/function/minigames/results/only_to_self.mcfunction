# Shows the results of a single player
# Needs $(UUID)

# Top three
$execute if score @s minigames_rank matches 1 run tellraw @s [{"color":"gold","text":"1st - "},{"color":"white","player":{"id":$(UUID)}}," - ",{"selector":"@s"}]
$execute if score @s minigames_rank matches 2 run tellraw @s [{"color":"#C4F5FF","text":"2nd - "},{"color":"white","player":{"id":$(UUID)}}," - ",{"selector":"@s"}]
$execute if score @s minigames_rank matches 3 run tellraw @s [{"color":"#FF802B","text":"3rd - "},{"color":"white","player":{"id":$(UUID)}}," - ",{"selector":"@s"}]

# Top 4+
$execute if score @s minigames_rank matches 4.. run tellraw @s [{"color":"white","text":""},{"score":{"name":"@s","objective":"minigames_rank"}},"th - ",{"color":"white","player":{"id":$(UUID)}}," - ",{"selector":"@s"}]

# Won
$execute if score @s minigames_rank matches 0 run tellraw @s [{"color":"gold","text":"Won - "},{"color":"white","player":{"id":$(UUID)}}," - ",{"selector":"@s"}]

# Tie
$execute if score @s minigames_rank matches -1 run tellraw @s [{"color":"gray","text":"Tie - "},{"color":"white","player":{"id":$(UUID)}}," - ",{"selector":"@s"}]

# Lost
$execute unless score @s minigames_rank matches -1.. run tellraw @s [{"color":"red","text":"Lost - "},{"color":"white","player":{"id":$(UUID)}}," - ",{"selector":"@s"}]