# ── 把地图放回去 ──
# 参数全部来自 tkot:map（由 maps/pick 抽图时写入），和 place_quiet 用同一套宏。
# 以前这里写死 tkot:map_test_1 0 0 -48，加第二张图就会永远放错。

$execute store success score #place_ok int run place template $(struct) $(x1) $(y1) $(z1) none none 1 0

$execute if score #place_ok int matches 1 run tellraw @a [{"text":"[TKOT] 地图已放回：$(struct)","color":"green"}]
$execute if score #place_ok int matches 0 run tellraw @a [{"text":"[TKOT] 放回失败：$(struct) 未加载或区块不可用","color":"red"}]

# 成功 → 收尾（卸强加载、复位分数、放开状态机）
execute if score #place_ok int matches 1 run function tkot:states/3/finish

