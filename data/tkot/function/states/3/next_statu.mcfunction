# ── 结算入口 ────────────────────────────────────────────────
# 结算画面统一在 states/3/finish 里播（地图放回成功、或放弃收尾时），
# 这里只负责复位大厅、清背包、传送、启动地图复位。

# 1. 大厅复位：先把大厅放回去（它自己不再传送，见 lobby/place_lobby 的说明）
function tkot:lobby/place_lobby

# 3. 回到大厅：清空背包（游戏道具不该被带出去），切成大厅模式
clear @a
gamemode adventure @a
# 回到大厅立刻关掉 PVP
gamerule pvp false

# 3. 送回大厅
function tkot:states/3/tp

# 4. 锁在状态 3，等 states/3/finish 把 #steps 归 0
scoreboard players set #steps int 3
# 新一轮复位，重试次数从 0 开始计
scoreboard players set #reset_retry int 0
function tkot:states/3/return_map

# 大厅增益由 effects/lobby 负责，这里不再给吸收