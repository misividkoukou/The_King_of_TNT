# ── 战斗进行中（#steps == 2）的玩家状态管理 ──
# 身份：2 = 本局存活   3 = 本局已淘汰   4 = 非本局观战
#
# 规则：本局之外的所有人（大厅里的、中途加入的、掉线重连的）一律转成旁观，
#       并由 maps/mapN_spectate 的包围盒关在场地里。

# 1. 非本局玩家（statu 0/1，含刚加入服务器的人）→ 局外观战
#    开局第一 tick 就会执行，所以大厅里的人会被“扯”进场地
execute as @a[scores={statu=0..1}] run scoreboard players set @s statu 4

# 2. 按当前地图重算 in_arena，并把出界的观战者拉回观察点
#    新增地图时，在这里加一行 dispatch（maps/mapN_spectate）
execute if score #map_num int matches 1 run function tkot:maps/map1_spectate

# 3. 观战身份（3/4）统一切旁观模式
#    想让调试队保持自由飞行，把这条改成 @a[scores={statu=3..4},team=!debug,...]
execute as @a[scores={statu=3..4},team=!debug,gamemode=!spectator] run gamemode spectator @s
