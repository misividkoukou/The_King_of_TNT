# 地图 2：48×48×48，单结构
# 模板文件需要放到 data/tkot/structure/map_2_1.nbt（还没放，放好后才能被抽到）

data modify storage tkot:map id set value 3

# 显示名：maps/map_intro 会用它做开场介绍，改成你要的名字
data modify storage tkot:map name set value "废弃前哨"

# 结构模板 id
data modify storage tkot:map struct set value "tkot:map_3_1"

# 下面这些和 map1 完全一致 —— 所有 48×48 的地图共用同一片场地
data modify storage tkot:map x1 set value 0
data modify storage tkot:map y1 set value 0
data modify storage tkot:map z1 set value -48

data modify storage tkot:map x2 set value 47
data modify storage tkot:map z2 set value -1

data modify storage tkot:map x set value 24
data modify storage tkot:map z set value -24
data modify storage tkot:map height set value 48

data modify storage tkot:map y_spawn set value 16
data modify storage tkot:map y_debug set value 60
data modify storage tkot:map max_height set value 47

# ── 这张图自己的环境设置 ──
# map1 会设成夜晚 + 刷怪，这些是全局状态，不会自动复原，
# 所以每张地图都应该显式声明自己的时间和刷怪规则，否则会继承上一张图。
time set night
gamerule spawn_monsters false
