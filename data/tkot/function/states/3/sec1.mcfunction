# ── 状态 3 的进度提示（每秒）──
# 这条 actionbar 同时是状态指示器：
#   红色「复位中」 = 还不能开始
#   数字往下走     = 复位正常进行
#   数字卡住不动   = fill 清理卡住了（区块没加载 / #max_height 没变）

# 兜底重传：结算那一刻正好在重生的玩家会错过 states/3/tp 的第一次传送，
# 这里每秒补一次，保证所有人最终都在大厅。
function tkot:lobby/tp_all

execute store result storage tkot:temp h int 1 run scoreboard players get #max_height int
execute store result storage tkot:temp retry int 1 run scoreboard players get #reset_retry int
function tkot:states/3/progress with storage tkot:temp
