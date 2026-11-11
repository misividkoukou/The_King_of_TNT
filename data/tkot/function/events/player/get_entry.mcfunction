# ── 按下标 $(j) 取一条事件的 name / color ──
# 其它地方想拿某个事件的显示名时，先设置 j，再调这个函数。
$data modify storage tkot:vote name set from storage tkot:vote names[$(j)]
$data modify storage tkot:vote color set from storage tkot:vote colors[$(j)]
