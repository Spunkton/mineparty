# Should be executed at tile
# Just a 3x3 square outline of red dust particles
# Needs array $(color) (RGB values float 0-1)

$particle dust{color:$(color),scale:0.15} ~-1.5 ~ ~1.2 0 0 0.15 0 16 normal
$particle dust{color:$(color),scale:0.15} ~-1.5 ~ ~0.4 0 0 0.15 0 16 normal
$particle dust{color:$(color),scale:0.15} ~-1.5 ~ ~-0.4 0 0 0.15 0 16 normal
$particle dust{color:$(color),scale:0.15} ~-1.5 ~ ~-1.2 0 0 0.15 0 16 normal

$particle dust{color:$(color),scale:0.15} ~1.5 ~ ~1.2 0 0 0.15 0 16 normal
$particle dust{color:$(color),scale:0.15} ~1.5 ~ ~0.4 0 0 0.15 0 16 normal
$particle dust{color:$(color),scale:0.15} ~1.5 ~ ~-0.4 0 0 0.15 0 16 normal
$particle dust{color:$(color),scale:0.15} ~1.5 ~ ~-1.2 0 0 0.15 0 16 normal

$particle dust{color:$(color),scale:0.15} ~1.2 ~ ~-1.5 0.15 0 0 0 16 normal
$particle dust{color:$(color),scale:0.15} ~0.4 ~ ~-1.5 0.15 0 0 0 16 normal
$particle dust{color:$(color),scale:0.15} ~-0.4 ~ ~-1.5 0.15 0 0 0 16 normal
$particle dust{color:$(color),scale:0.15} ~-1.2 ~ ~-1.5 0.15 0 0 0 16 normal

$particle dust{color:$(color),scale:0.15} ~1.2 ~ ~1.5 0.15 0 0 0 16 normal
$particle dust{color:$(color),scale:0.15} ~0.4 ~ ~1.5 0.15 0 0 0 16 normal
$particle dust{color:$(color),scale:0.15} ~-0.4 ~ ~1.5 0.15 0 0 0 16 normal
$particle dust{color:$(color),scale:0.15} ~-1.2 ~ ~1.5 0.15 0 0 0 16 normal