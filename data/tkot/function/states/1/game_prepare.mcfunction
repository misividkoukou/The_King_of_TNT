# 1. 抽地图 + 按地图锁区块（必须在 tp / 分散之前，否则区块没加载会失败）
function tkot:maps/pick

# 2. 地图介绍（占位）：宏参数来自 tkot:map 的 id / name / total
function tkot:maps/map_intro with storage tkot:map

# 3. 开战前铺一次地图（延后 2 tick，等 forceload 生效）
#    作用：全新存档的第一局、或上次复位失败导致场地为空时兜底，避免玩家被 tp 到空中摔死
schedule function tkot:states/1/place_map 2t replace

# 4. 开场倒计时
scoreboard players set #temp sec 5