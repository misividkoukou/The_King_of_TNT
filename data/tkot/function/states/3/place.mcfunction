# ── 把地图放回去 ──
# 排查版本：模板名和坐标先写死，不走宏。
# 确认能跑通后再换回 $(struct) $(x1) $(y1) $(z1)（参数来自 tkot:map）。

execute store success score #place_ok int run place template tkot:map_test_1 0 0 -48 none none 1 0

execute if score #place_ok int matches 1 run tellraw @a [{"text":"[TKOT] 地图已放回","color":"green"}]
execute if score #place_ok int matches 0 run tellraw @a [{"text":"[TKOT] 放回失败：模板未加载或坐标不可用","color":"red"}]

# 成功 → 收尾（卸强加载、复位分数、放开状态机）
execute if score #place_ok int matches 1 run function tkot:states/3/finish
