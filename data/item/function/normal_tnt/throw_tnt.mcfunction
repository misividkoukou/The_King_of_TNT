# 收回进度：不撤销的话 consume_item 只会触发一次，之后再也扔不出 TNT
advancement revoke @s only item:normal_tnt_stick

# 公共瞄准计算：lat=0 表示正前方
data modify storage tkot:throw lat set value 0
function item:common/aim with storage tkot:throw

# 用宏召唤普通 TNT
execute at @s run function item:normal_tnt/throw_tnt_with_macro with storage tkot:throw
