# ── 开战前铺图（静默版）──
# 和 states/3/place 的区别：这里不调 finish，不影响状态机，只负责把地图放回模板。
# 用途：全新存档的第一局、以及上一次复位失败导致场地是空的时候兜底。
# 由 states/1/place_map 延后 2 tick 调用（等 forceload 真正生效）。

$execute store success score #map_ok int run place template $(struct) $(x1) $(y1) $(z1) none none 1 0

$execute if score #map_ok int matches 0 run tellraw @a [{"text":"[TKOT] 开战前铺图失败：$(struct)","color":"red"}]
