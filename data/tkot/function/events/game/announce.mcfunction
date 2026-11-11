# ── 事件节拍 + 投票调度（每秒调用一次）──
# 由 states/2/sec1 每秒调用，靠 #left（距下次事件还有几秒）分支。
# 一轮 30 秒：
#   left 20 → 50% 概率开放投票（10 秒投票窗口）
#   left 10 → 截止统计（只有真的开了投票才需要）
#   left  5 → 公布结果
#   left  0 → states/2/sec1 触发事件

execute if score #left int matches 20 run function tkot:events/player/maybe_open
execute if score #left int matches 10 if score #vote_opened int matches 1 run function tkot:events/player/close
execute if score #left int matches 5 run function tkot:events/player/announce
