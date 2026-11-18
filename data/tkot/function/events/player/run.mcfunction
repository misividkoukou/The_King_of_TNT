# ── 宏循环：启动 ──
# 调用前先设置要执行的 step：
#   data modify storage tkot:vote step set value "tkot:events/player/step/xxx"
# 然后 function tkot:events/player/run
#
# #vi = 当前事件号（1 起）  #vj = 列表下标（0 起，因为 NBT 列表是 0 基）

execute store result score #vote_count int run data get storage tkot:vote count

scoreboard players set #vi int 1
scoreboard players set #vj int 0
execute store result storage tkot:vote i int 1 run scoreboard players get #vi int
execute store result storage tkot:vote j int 1 run scoreboard players get #vj int

function tkot:events/player/loop with storage tkot:vote
