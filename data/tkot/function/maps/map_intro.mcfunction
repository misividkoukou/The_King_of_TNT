# ── 地图开场介绍（占位版）──
# 由 states/1/game_prepare 在抽完地图后调用：attach storage tkot:map
# 宏参数：$(id) $(name) $(total)
#
# 现在只做聊天栏 + actionbar 提示。
# ★ 不要用 title：states/1/announce 每秒都会发一次倒计时 title，会把这里的盖掉。
#   以后想做大标题/截图介绍，建议放在 state 0→1 之前，或者和倒计时错开。

$tellraw @a [{"text":"[TKOT] ","color":"gold"},{"text":"本局地图：","color":"gray"},{"text":"$(name)","color":"aqua"}]
$title @a actionbar [{"text":"地图 ","color":"gray"},{"text":"$(name)","color":"aqua","bold":true}]

playsound minecraft:ui.toast.challenge_complete master @a
