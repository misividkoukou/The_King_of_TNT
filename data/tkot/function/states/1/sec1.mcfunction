# 准备阶段（intro）：每秒刷新大厅增益
function tkot:effects/lobby

# 每秒减去 1
scoreboard players remove #temp sec 1

execute store result storage tkot:temp sec int 1 run scoreboard players get #temp sec
execute if score #temp sec matches 0 run function tkot:states/1/next_statu
execute if score #temp sec matches 1.. run function tkot:states/1/announce with storage tkot:temp
