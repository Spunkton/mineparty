#Makes the helper speak all their lines

#Clear dialog
data remove entity @n[tag=helper] data.dialog

#Queue all lines
function mineparty:game/helper/dialog/line