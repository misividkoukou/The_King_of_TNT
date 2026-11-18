# ── 随机事件池 ──
# 只有没人投票（#vote_ready = 0）时才随机写 #events。
# 这里算好随机上限，再交给宏函数 roll_core 执行。

# 事件表参数
execute store result score #vote_count int run data get storage tkot:vote count
execute store result score #border_id int run data get storage tkot:vote border

# 随机上限：边界已到最小（#border_dead = 1）时少一个可选事件
scoreboard players operation #rollmax int = #vote_count int
execute if score #border_dead int matches 1 run scoreboard players remove #rollmax int 1
execute store result storage tkot:vote rollmax int 1 run scoreboard players get #rollmax int

function tkot:events/player/roll_core with storage tkot:vote

# ★ 跳过"边界收缩"：抽到的位置 >= 边界编号时顺移一位。
#   这样不管边界在事件表第几项都能正确排除，不再依赖"边界必须是最后一项"。
#   例：边界是第 6 项、总数 6 → 上限 5，永远抽不到 6，这一行不触发；
#       边界若变成第 3 项、总数 6 → 上限 5，抽到 3/4/5 会顺移成 4/5/6。
execute if score #border_dead int matches 1 if score #events int >= #border_id int run scoreboard players add #events int 1
