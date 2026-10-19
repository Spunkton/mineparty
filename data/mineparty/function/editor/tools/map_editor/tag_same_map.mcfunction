# Needs $(map)

$tag @e[type=marker,tag=tile,nbt={data:{map:"$(map)"}}] add ping
$title @s actionbar {"color":"green","text":"All tiles in the map \"$(map)\"."}