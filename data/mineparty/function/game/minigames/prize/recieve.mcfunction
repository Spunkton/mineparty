# Executed at and as player recieving
# Needs $(minigame_prize)

$function mineparty:game/items/gold/give {amount:$(minigame_prize)}
$tellraw @s "\u00a76You won +$(minigame_prize) gold!"