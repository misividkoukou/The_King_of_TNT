# ── 落位 ──
# 参战者的落点由 states/2/tp/spread_players 决定，
# 每个地图的 9 个出生点硬编码在 states/2/tp/spawns/mapN.mcfunction 里。
# 以后换成 spreadplayers 就替换下面这一句即可。
function tkot:states/2/tp/spread_players
# 调试队送到观察点
$tp @a[team=debug] $(x) $(y_debug) $(z)

# 初始化世界边界（中心 + 大小 26，缩圈链的起点）
function tkot:states/2/setborder

title @a[team=!debug,gamemode=!spectator] title {"text":"开始战斗! 物资将在五秒后开始发放","color":"red"}

# 5 秒后开始发物资
# 金色胡萝卜打 game_item 标记，否则大厅的每秒清理认不出它、会一直留在背包里
schedule function tkot:states/2/give_item 5s replace