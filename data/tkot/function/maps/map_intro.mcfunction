# ── 地图开场介绍（占位版）──
# 由 states/1/game_prepare 在抽完地图后调用：attach storage tkot:map
# 宏参数：$(id) $(name) $(total)
#
# 现在只做聊天栏 + actionbar 提示。
# ★ 不要用 title：states/1/announce 每秒都会发一次倒计时 title，会把这里的盖掉。
#   以后想做大标题/截图介绍，建议放在 state 0→1 之前，或者和倒计时错开。

$tellraw @a [{"text":"[TKOT] ","color":"gold"},{"text":"本局地图：","color":"gray"},{"text":"$(name)","color":"aqua"}]
$title @a actionbar [{"text":"地图 ","color":"gray"},{"text":"$(name)","color":"aqua","bold":true}]

tellraw @a {"text":"--------------------------",color:gold}
tellraw @a {"text":"地图介绍"}
execute if score #map_num int matches 1 run tellraw @a [{"text":"深夜...来临了..."},{text:"  "},{"text":"在这里,最恐怖的也许不是玩家....",color:"aqua"},{text:"\n"},{text:"作者:misivid_koukou",color:green,"hover_event":{"action":"show_text","value":{text:"最牛逼的人没有谁了!"}}}]
execute if score #map_num int matches 2 run tellraw @a [{"text":"和平的一个营地"},{text:"  "},{"text":"问题是，怎么像村庄一样啊喂",color:"aqua"},{text:"\n"},{text:"作者:winterdisa",color:green,"hover_event":{"action":"show_text","value":{text:"太感谢了!"}}}]
execute if score #map_num int matches 3 run tellraw @a [{"text":"废弃前哨"},{text:"  "},{"text":"似乎是掠夺者的前哨，但是似乎有着不为人知的秘密...",color:"aqua"},{text:"\n"},{text:"作者:misivid_koukou",color:green,"hover_event":{"action":"show_text","value":{text:"提示居然不一样哦？!"}}}]
execute if score #map_num int matches 4 run tellraw @a [{"text":"腐朽文明"},{text:"  "},{"text":"腐朽..?也许吧，毕竟全是蘑菇...",color:"aqua"},{text:"\n"},{text:"作者:winterdisa",color:green,"hover_event":{"action":"show_text","value":{text:"狂干几个小时弄出来的，今晚起飞了！"}}}]
execute if score #map_num int matches 5 run tellraw @a [{"text":"又是夜晚，可是没有怪物"},{text:"  "},{"text":"视力大挑战这一块",color:"aqua"},{text:"\n"},{text:"作者:winterdisa",color:green,"hover_event":{"action":"show_text","value":{text:"唐福一个!"}}}]
tellraw @a {"text":"--------------------------",color:gold}
playsound minecraft:ui.toast.challenge_complete master @a
