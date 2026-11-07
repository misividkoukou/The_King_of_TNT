# ── 只清理本数据包生成的 TNT 棍（玩家背包）──
# 地面掉落物不在这里处理：states/overall/clean 每秒会把所有 tag=!tkot_keep 的物品实体清掉，
# 已经覆盖了“死亡撒出来的 TNT 棍”，这里再按 NBT 匹配一次是重复且更贵的。

clear @a[team=!debug] minecraft:stick[minecraft:custom_data~{tnt:true}]
