# ── 播报"下一轮事件是什么"（宏，美化区）──
# ★ 发给所有人（含场上玩家），见 issue #61
# 事件名和颜色来自事件表（tkot:vote names/colors）

$tellraw @a [{"text":"  ▸ "},{"text":"$(name)","color":"$(color)","bold":true}]
