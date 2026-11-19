# ── 弹跳 TNT：投掷入口（上下文 = 玩家）──
# 与 normal / multishot 一致：先撤销进度，否则 consume_item 只会触发一次。
# 注意：custom_data 的 type 必须与 item:advancement/bounce_tnt_stick 完全一致（"bounce"）。

advancement revoke @s only item:bounce_tnt_stick

# 公共瞄准计算：lat=0 表示正前方
data modify storage tkot:throw lat set value 0
function item:common/aim with storage tkot:throw

# 用宏召唤弹跳 TNT
execute at @s run function item:bounce_tnt/throw_tnt_with_macro with storage tkot:throw
