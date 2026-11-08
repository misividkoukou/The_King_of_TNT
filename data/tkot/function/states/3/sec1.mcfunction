# ── 状态 3（每秒）──
#
# 停留期间（#over_wait = 1..100）：玩家是旁观，留在场上自由飞，不传送
# 停留结束后（#over_wait = -1） ：把人送回大厅，并显示复位进度

# 停留倒计时面板
execute if score #over_wait int matches 1.. run scoreboard players remove #over_sec int 1
execute if score #over_wait int matches 1.. if score #over_sec int matches ..0 run scoreboard players set #over_sec int 1
execute store result storage tkot:temp ow int 1 run scoreboard players get #over_sec int
execute if score #over_wait int matches 1.. run function tkot:states/3/wait_announce with storage tkot:temp

# 停留结束后：把不在大厅范围内的人拉回来（重生的玩家也不会漏）
execute if score #over_wait int matches ..-1 as @a at @s unless entity @s[x=0,y=-64,z=200,dx=48,dy=64,dz=48] run function tkot:lobby/tp_point

# 复位进度面板（只在清理阶段显示）
execute store result storage tkot:temp h int 1 run scoreboard players get #max_height int
execute store result storage tkot:temp retry int 1 run scoreboard players get #reset_retry int
execute if score #over_wait int matches ..-1 run function tkot:states/3/progress with storage tkot:temp
