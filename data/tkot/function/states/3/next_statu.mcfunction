# ── 结算入口 ────────────────────────────────────────────────
# 流程：播报 → 切旁观/清背包/关 PvP → 锁状态 3 → 停留 5 秒 → 开始清理场地
#
# 结束后【不传送】：
#   · 玩家切成旁观模式，可以自己飞着看（这个阶段不再有场地边界限制）
#   · 回到大厅交给下一阶段：states/0 把 statu 归 0 后，
#     states/overall/tick1 的 lobby/rescue 会把还在场外的人送回大厅

function tkot:states/3/announce
playsound entity.player.levelup master @a

# 清空背包、切成旁观（不然留在场上会一直掉）、关 PvP
clear @a
gamemode spectator @a
gamerule pvp false

# 锁在状态 3，等 states/3/finish 把 #steps 归 0
scoreboard players set #steps int 3
# 新一轮复位，重试次数从 0 开始计
scoreboard players set #reset_retry int 0

# 结算停留：100 tick ≈ 5 秒（#over_sec 只用于面板显示的秒数）
scoreboard players set #over_wait int 100
scoreboard players set #over_sec int 5
