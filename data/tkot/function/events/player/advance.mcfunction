# ── 宏循环：推进到下一个事件 ──
# 由各个 step 函数在末尾调用。

scoreboard players add #vi int 1
scoreboard players add #vj int 1
execute store result storage tkot:vote i int 1 run scoreboard players get #vi int
execute store result storage tkot:vote j int 1 run scoreboard players get #vj int

execute if score #vi int <= #vote_count int run function tkot:events/player/loop with storage tkot:vote
