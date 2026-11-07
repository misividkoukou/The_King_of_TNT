# ── 战斗进行中（#steps == 2）的玩家状态管理 ──
# 身份：2 = 本局存活   3 = 本局已淘汰   4 = 非本局观战
#
# 规则：本局之外的所有人（大厅里的、中途加入的、掉线重连的）一律转成旁观。
#       旁观者可以自由飞行，不受场地边界限制。

# 1. 非本局玩家（statu 0/1，含刚加入服务器的人）→ 局外观战
#    开局第一 tick 就会执行，所以大厅里的人会被“扯”进场地
#    team=!debug：调试队不进这个流程，他们在 spread 里被送到 y_debug 观察点
execute as @a[scores={statu=0..1},team=!debug] run scoreboard players set @s statu 4

# 2. 重算 in_arena，并判死离开场地的存活玩家
#    所有 48×48 的地图共用同一片场地和同一份边界判定
#    观战者不再被限制在场地内，所以这个函数已经没有宏参数，不用带 storage
function tkot:maps/map1_spectate

# 3. 观战身份（3/4）统一切旁观模式
#    想让调试队保持自由飞行，把这条改成 @a[scores={statu=3..4},team=!debug,...]
execute as @a[scores={statu=3..4},team=!debug,gamemode=!spectator] run gamemode spectator @s
