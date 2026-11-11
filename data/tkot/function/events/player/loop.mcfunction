# ── 宏循环：单步 ──
# 取出第 j 项的名字/颜色/函数，然后交给 $(step) 处理。
# 注意：宏参数在【函数调用时】就已经替换完，所以这里先把 name/color 写进 storage，
# 再调用 step（step 是另一个宏函数，它会用新的 storage 重新取值）。

$data modify storage tkot:vote name set from storage tkot:vote names[$(j)]
$data modify storage tkot:vote color set from storage tkot:vote colors[$(j)]
$data modify storage tkot:vote func set from storage tkot:vote funcs[$(j)]

$function $(step) with storage tkot:vote
