# ── 取第 $(j) 项的事件本体函数名 ──
# 注意：宏参数在函数【被调用时】就已经替换完，所以不能在同一个文件里
#       先 data modify 设 func、再 $function $(func) —— 那样 $(func) 用的还是旧值。
# 必须拆成两个函数：这里取名字，再调用 call_func。

$data modify storage tkot:vote func set from storage tkot:vote funcs[$(j)]

function tkot:events/player/call_func with storage tkot:vote
