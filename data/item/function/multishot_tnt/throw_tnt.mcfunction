# 收回进度：不撤销的话 consume_item 只会触发一次，之后再也扔不出 TNT
advancement revoke @s only item:multishot_tnt_stick

# ── 扇形三连 ──
# lat 是「侧向偏移格数」：正数向左、0 正前、负数向右。
# 每一发都重新算一次方向，所以三颗从同一个点出发、朝向不同，自然散开。
# 想改扇形广度：只改下面三个 1.5（数值越大散得越开，同时前进速度会略降）。
# 想改颗数：复制/删减这对「set lat + aim + summon」，保持对称即可。

data modify storage tkot:throw lat set value 1.7
function item:common/aim with storage tkot:throw
execute at @s run function item:multishot_tnt/throw_tnt_with_macro with storage tkot:throw

data modify storage tkot:throw lat set value 0
function item:common/aim with storage tkot:throw
execute at @s run function item:multishot_tnt/throw_tnt_with_macro with storage tkot:throw

data modify storage tkot:throw lat set value -1.7
function item:common/aim with storage tkot:throw
execute at @s run function item:multishot_tnt/throw_tnt_with_macro with storage tkot:throw

# 主人（owner）在每一发的宏里单独记：data modify entity 不接受多个实体，
# 所以不能在这里用 @e[...,limit=3] 一次性写入。
