# ── 事件投票：统计结果 ──
# ★ 三轮宏遍历，不需要按事件逐个写：
#   第 1 轮 tally1 → #vote_total（总票数）+ #vmax（最高票）
#   第 2 轮 tally2 → #ties（并列数量）
#   第 3 轮 tally3 → 唯一最高时定案 #next_event
#   有并列再跑 step/tie 随机抽一个
#
# 产出：#next_event = 本轮事件号；#vote_ready = 1 表示"投票有效，别随机"

scoreboard players set #vote_total int 0
scoreboard players set #vmax int 0
scoreboard players set #ties int 0
scoreboard players set #next_event int 0
scoreboard players set #vote_ready int 0

data modify storage tkot:vote step set value "tkot:events/player/step/tally1"
function tkot:events/player/run

# 没人投票 → 直接退出，让 events/game/random 去随机
execute if score #vote_total int matches 0 run return 0

data modify storage tkot:vote step set value "tkot:events/player/step/tally2"
function tkot:events/player/run

data modify storage tkot:vote step set value "tkot:events/player/step/tally3"
function tkot:events/player/run

# 并列 → 系统从并列项里随机抽一个
execute if score #ties int matches 2.. run execute store result storage tkot:vote ties int 1 run scoreboard players get #ties int
execute if score #ties int matches 2.. run function tkot:events/player/pick_tie with storage tkot:vote

# ★ 上限校验（非宏命令，不依赖 storage 里的 votemax）：
#   没到解锁时间时只能投前 early 个事件；投到未解锁事件（比如手动 trigger 投边界）就作废。
#   #vote_max 由 close.mcfunction 在计票前算好。
execute if score #next_event int > #vote_max int run scoreboard players set #next_event int 0

# 有结果了才标记，防止 #next_event 为 0 时把 #events 覆盖成 0
execute if score #next_event int matches 1.. run scoreboard players set #vote_ready int 1
