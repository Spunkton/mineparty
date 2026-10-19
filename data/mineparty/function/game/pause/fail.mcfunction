#Just a notification
tellraw @a "\u00a7cPause function failed!"
tellraw @a[tag=host] "\u00a7dMake sure that function permission level is at least 3 in server.properties."
tellraw @a[tag=host] "\u00a7dFor now, you can type \"/tick freeze\" manually."
clear @a *[custom_data~{unpause:true}]

#Reset pause
scoreboard players set pause mineparty 0
title @a title ""