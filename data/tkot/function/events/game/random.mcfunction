# ── 抽取并触发一个事件 ──
# ★ 完全由事件表驱动（events/player/table.mcfunction）：
#   加事件只需要改表，这个文件不用动
#
# 有投票结果（#vote_ready=1）→ 直接用 #next_event，跳过随机
# 没人投票（#vote_ready=0）     → 才随机

# 事件表参数（投票路径也要用）
execute store result score #border_id int run data get storage tkot:vote border

# 1) 投票结果优先
execute if score #vote_ready int matches 1 run scoreboard players operation #events int = #next_event int

# 2) 边界已经到最小 → 投给"边界收缩"的票作废，改走随机
#    （否则 end → random → 又抽到边界 → end，递归 + 一轮两个事件播报）
execute if score #border_dead int matches 1 if score #events int = #border_id int run scoreboard players set #vote_ready int 0

# 3) 没票（或票作废）才随机
function tkot:events/player/roll with storage tkot:vote

# 4) 投票只生效一次
execute if score #vote_ready int matches 1 run scoreboard players set #vote_ready int 0

# 播报 + 分发都按事件表来
scoreboard players operation #vj int = #events int
scoreboard players remove #vj int 1
execute store result storage tkot:vote j int 1 run scoreboard players get #vj int

function tkot:events/player/get_entry with storage tkot:vote
function tkot:events/player/say_event with storage tkot:vote
function tkot:events/player/dispatch with storage tkot:vote
