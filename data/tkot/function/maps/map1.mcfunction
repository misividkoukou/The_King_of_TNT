# 地图 1：测试图（48×48×48，单结构）
# 结构模板由结构方块保存后放进 data/tkot/structure/map_test_1.nbt

data modify storage tkot:map id set value 1

# 结构模板 id —— 以后改模板名只改这一行
data modify storage tkot:map struct set value "tkot:map_test_1"

# 结构落点 = 模板原点（place template 的坐标）。区域 x 0..47 / y 0..47 / z -48..-1
data modify storage tkot:map x1 set value 0
data modify storage tkot:map y1 set value 0
data modify storage tkot:map z1 set value -48

# 清理范围的另一角（与模板同尺寸）
data modify storage tkot:map x2 set value 47
data modify storage tkot:map z2 set value -1

# 场地中心：出生点 / 观战点都基于它
data modify storage tkot:map x set value 24
data modify storage tkot:map z set value -24

# 出生高度：地板是模板的 y=0 层，所以人站在 1
data modify storage tkot:map y_spawn set value 1

# 观战/调试观察点
data modify storage tkot:map y_debug set value 60

# 清理从最高层往下（模板顶层是 47）
data modify storage tkot:map max_height set value 47
