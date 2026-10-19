# Needs $(map)

$tag @e[type=marker,tag=tile,nbt={data:{map:"$(map)",type:"$(type)"}}] add ping
$title @s actionbar {"color":"green","text":"All tiles of type \"$(type)\" in the map \"$(map)\"."}