# ── 播报"刚刚触发了什么事件"（宏）──
$tellraw @a [{"text":"[TKOT·事件] ","color":"gold"},{"text":"$(name)","color":"$(color)"}]
# 第二行：事件介绍（按 #events 分支，文案在 intro.mcfunction）
function tkot:events/player/intro
