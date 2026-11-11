# ── 事件投票：结束投票（距下次事件 10 秒）──
# ★ 计票由事件表驱动，不需要按事件逐个写
# 投票权：旁观者 / 大厅里的人可以投；场上还活着的参战者（statu=2）不算

# 先把票读出来再 reset（reset 会清分数，也会一并取消 trigger 权限）
# 注意：这里不能提前 reset，否则下面的计票就全读到 0 了。

# ── 计算本轮允许的最大事件编号 ──
# 没到解锁时间时，只能投前 early 个事件。
# 这一限制同时堵住"手动 /trigger vote set 6 绕过界面投边界"的漏洞。
execute store result score #vote_early int run data get storage tkot:vote early
execute store result score #vote_count int run data get storage tkot:vote count
execute store result score #unlock int run data get storage tkot:vote unlock
scoreboard players operation #vote_max int = #vote_count int
execute if score #game_min_timer int < #unlock int run scoreboard players operation #vote_max int = #vote_early int
execute store result storage tkot:vote votemax int 1 run scoreboard players get #vote_max int

# 宏循环计票
data modify storage tkot:vote step set value "tkot:events/player/step/close"
function tkot:events/player/run

# 清掉 trigger 分数，避免下一轮误计
scoreboard players reset @a vote

function tkot:events/player/tally
