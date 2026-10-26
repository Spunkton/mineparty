advancement revoke @s only mineparty:other/doohickeys/wordle

kill @e[tag=wordle]
summon block_display ~ ~ ~ {Tags:["wordle","wordle_seat"],Passengers:[]}
summon text_display ~ ~1.02 ~ {billboard:"center",Tags:["wordle","wordle_text"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,-0.1f],scale:[0.1f,0.1f,0.1f]},text:"Test"}

ride @s mount @n[tag=wordle_seat]