# ── 状态 3 的兜底（每秒）──
# 只把“不在大厅范围内”的人拉回来：
# 原来是无条件 tp_all，玩家在结算这 1~2 秒里会被反复钉在传送点，动都动不了。
execute as @a at @s unless entity @s[x=0,y=-64,z=200,dx=48,dy=64,dz=48] run function tkot:lobby/tp_point

execute store result storage tkot:temp h int 1 run scoreboard players get #max_height int
execute store result storage tkot:temp retry int 1 run scoreboard players get #reset_retry int
function tkot:states/3/progress with storage tkot:temp
