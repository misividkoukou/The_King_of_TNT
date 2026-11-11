# ── 生成一颗（random.mcfunction 会循环调用 5 次）──
# 每次重新抽坐标，所以 5 颗位置各不相同。

execute store result storage tnt:spawn pos.x int 1 run random value 0..47
execute store result storage tnt:spawn pos.y int 1 run random value 0..47
execute store result storage tnt:spawn pos.z int 1 run random value -48..-1

# ★ 宏只能读"被传入 compound"的顶层键 → 传 pos 这一层，键就是 x/y/z
function tkot:events/game/summon_tnt/summon with storage tnt:spawn pos

scoreboard players remove #tnt_left int 1
execute if score #tnt_left int matches 1.. run function tkot:events/game/summon_tnt/spawn_one
