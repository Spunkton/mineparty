#Cancel schedule
schedule clear mineparty:game/tiles/move/loop

#Remove tags
tag @e[tag=tile] remove move_to
tag @e[tag=tile] remove move_from
tag @e[tag=tile] remove move_update
tag @e[tag=tile] remove move_past
tag @e[tag=tile] remove landed_on
tag @e[tag=tile] remove continue_from
tag @a remove moving
tag @a remove will_continue

#Remove indicators
kill @e[tag=move_to_indicator]
kill @e[tag=special_link_indicator]