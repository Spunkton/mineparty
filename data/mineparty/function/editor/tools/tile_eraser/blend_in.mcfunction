# Replaces tile blocks with blocks surrounding it
# Executed at tile


#  X = tile replaced
#   v
#  #X#
# >X#X<
#  #X#
#   ^
clone ~ ~-1 ~-2 ~ ~-1 ~-2 ~ ~-1 ~-1
clone ~ ~-1 ~2 ~ ~-1 ~2 ~ ~-1 ~1
clone ~-2 ~-1 ~ ~-2 ~-1 ~ ~-1 ~-1 ~
clone ~2 ~-1 ~ ~2 ~-1 ~ ~1 ~-1 ~

#    v
# >X#X
#  ###
#  X#X<
#  ^
clone ~-1 ~-1 ~-2 ~-1 ~-1 ~-2 ~-1 ~-1 ~-1
clone ~1 ~-1 ~2 ~1 ~-1 ~2 ~1 ~-1 ~1
clone ~-2 ~-1 ~1 ~-2 ~-1 ~1 ~-1 ~-1 ~1
clone ~2 ~-1 ~-1 ~2 ~-1 ~-1 ~1 ~-1 ~-1

#  ###
#>>#X#
#  ###
clone ~ ~-1 ~1 ~ ~-1 ~1 ~ ~-1 ~