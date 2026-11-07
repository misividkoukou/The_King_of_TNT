# ── 抽取地图 ──────────────────────────────────────────────
# 地图总数：目前 2 张（map1 测试图 / map2 = map_2_1）
#
#  map_2_1.nbt 还没放进 data/tkot/structure/ 之前，先保持下面第 1 行（写死 1）。
#   放好之后把这行注释掉、启用 random 那行，否则有一半概率抽到不存在的模板、铺图失败。
execute store result score #map_num int run random value 1..2


# 把选中地图的参数装进工作 storage tkot:map
# 新增地图：①加 maps/mapN.mcfunction ②这里加一行 dispatch
execute if score #map_num int matches 1 run function tkot:maps/map1
execute if score #map_num int matches 2 run function tkot:maps/map2

# 场地强加载。注意：forceload 用【方块坐标】(x1 z1 x2 z2)，不是区块坐标！
# 所有 48×48 的地图共用这一片场地（x 0..47 / z -48..-1），所以不需要按地图号区分
forceload add 0 -48 47 -1
