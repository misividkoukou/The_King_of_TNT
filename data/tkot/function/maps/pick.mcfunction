# ── 抽取地图 ──────────────────────────────────────────────
# 地图总数：4 张（map1 怪物之夜 / map2 营地 / map3 废弃前哨 / map4 腐朽文明）
#
# ⚠ 抽到哪张就必须 dispatch 到哪张，否则 tkot:map 里留的是上一局的旧数据，
#   模板名和坐标全错，铺图直接失败。新增地图时这里必须同步加一行。
execute store result score #map_num int run random value 1..4

# 地图总数写进 storage，给 maps/map_intro 显示"第 N / 共 M 张"（map_intro 的 $(total) 依赖它）
data modify storage tkot:map total set value 4

# 把选中地图的参数装进工作 storage tkot:map
# 新增地图：①加 maps/mapN.mcfunction ②这里加一行 dispatch
execute if score #map_num int matches 1 run function tkot:maps/map1
execute if score #map_num int matches 2 run function tkot:maps/map2
execute if score #map_num int matches 3 run function tkot:maps/map3
execute if score #map_num int matches 4 run function tkot:maps/map4

# 场地强加载。注意：forceload 用【方块坐标】(x1 z1 x2 z2)，不是区块坐标！
# 所有 48×48 的地图共用这一片场地（x 0..47 / z -48..-1），所以不需要按地图号区分
forceload add 0 -48 47 -1
