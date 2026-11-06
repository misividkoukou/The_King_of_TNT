# ── 抽取地图 ──────────────────────────────────────────────
# 现在只有 1 张图。random value 的范围大小必须 ≥2，所以 1..1 会直接报错，先写死。
scoreboard players set #map_num int 1
# 加到 2 张及以上之后：注释掉上面那行，启用下面这行（把 2 改成地图总数）
# execute store result score #map_num int run random value 1..2

# 把选中地图的参数装进工作 storage tkot:map
# 新增地图：①加 maps/mapN.mcfunction ②这里加一行 dispatch ③按需加 mapN_spectate
execute if score #map_num int matches 1 run function tkot:maps/map1

# 按地图锁区块。注意：forceload 用【方块坐标】(x1 z1 x2 z2)，不是区块坐标！
# 地图区 x 0..47 / z -48..-1 → 对应区块 (0..2, -3..-1)
execute if score #map_num int matches 1 run forceload add 0 -48 47 -1
