# ── 事件节拍 + 投票调度（每秒调用一次）──
# 由 states/2/sec1 每秒调用，靠 #left（距下次事件还有几秒）分支。
# 一轮 30 秒：
#   left 30 → 新一轮开始，先清掉上一轮的投票结果
#   left 20 → 50% 概率开放投票（10 秒投票窗口）
#   left 10 → 截止统计（只有真的开了投票才需要）
#   left  5 → 公布结果
#   left  0 → states/2/sec1 触发事件

# ★ 关键：每轮开始必须把上一轮的结果清干净。
#   否则"本轮不开放投票"时 #vote_ready 还留着上一轮的 1，
#   播报会显示上一轮的事件名，events/game/random 也会沿用上一轮的投票结果。
execute if score #left int matches 30 run scoreboard players set #vote_ready int 0
execute if score #left int matches 30 run scoreboard players set #next_event int 0
execute if score #left int matches 30 run scoreboard players set #vote_total int 0
execute if score #left int matches 30 run scoreboard players set #vote_opened int 0

execute if score #left int matches 20 run function tkot:events/player/maybe_open
execute if score #left int matches 10 if score #vote_opened int matches 1 run function tkot:events/player/close
execute if score #left int matches 5 run function tkot:events/player/announce
