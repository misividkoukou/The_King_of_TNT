# ── 硫方怪 TNT（试验品）：投掷入口（上下文 = 玩家）──
# 逻辑与抛射型 TNT 一致：撤销进度 → 公共瞄准 → 宏召唤。
# 区别只在召唤出来的东西：一颗装着 TNT 的硫方怪（contained TNT），并把它的
# minecraft:bounciness 拉满，用来观察 26.2 新增弹性属性在真实实体上的表现。
#
# ★ 这个物品【不进任何战利品表/开局发放】，只能管理员用：
#     /function item:sulfur_tnt/give

advancement revoke @s only item:sulfur_tnt_stick

# 公共瞄准计算：lat=0 表示正前方
data modify storage tkot:throw lat set value 0
function item:common/aim with storage tkot:throw

# 用宏召唤硫方怪
execute at @s run function item:sulfur_tnt/summon with storage tkot:throw
