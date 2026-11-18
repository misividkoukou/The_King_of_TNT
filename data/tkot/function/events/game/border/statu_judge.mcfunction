# ── 边界收缩判定 ──
# 按"区间"判档，而不是按精确值判档。
#
# ★ 为什么不能用 matches 50 / 40 / 30 / 20 / 10：
#   每档都是 worldborder set N 10s（10 秒过渡），在这 10 秒里 worldborder get
#   返回的是 49.3 / 45.1 这种中间值，被 store result 截断成 49 / 45，
#   精确匹配一个都不成立 → 这次事件什么都不做、静默浪费一次机会。
#
# 区间判定下，过渡期间触发也会落回"下一档"，行为是自愈的。

execute store result score #border_range int run worldborder get

execute if score #border_range int matches ..10 run function tkot:events/game/border/end
execute if score #border_range int matches 11..20 run function tkot:events/game/border/to10
execute if score #border_range int matches 21..30 run function tkot:events/game/border/to20
execute if score #border_range int matches 31..40 run function tkot:events/game/border/to30
execute if score #border_range int matches 41..50 run function tkot:events/game/border/to40
