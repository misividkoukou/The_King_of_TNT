# ── 落位 ──
# 参战者的落点由 states/2/tp/spread_players 决定：
#   3×3 网格 (12|24|36, height, -12|-24|-36)，每人随机一个格子，
#   其中 height 是每张地图自己维护的出生高度（见 maps/mapN.mcfunction）。
# 以后换成 spreadplayers 就替换第 6 行那一句即可。
function tkot:states/2/tp/spread_players with storage tkot:map
# 调试队送到观察点
$tp @a[team=debug] $(x) $(y_debug) $(z)

title @a[team=!debug,gamemode=!spectator] title {"text":"开始战斗! 物资将在五秒后开始发放","color":"red"}

# 5 秒后开始发物资
execute if score #steps int matches 2 run give @a[team=!debug,gamemode=!spectator,scores={statu=2}] golden_carrot 5
schedule function tkot:states/2/give_item 5s replace