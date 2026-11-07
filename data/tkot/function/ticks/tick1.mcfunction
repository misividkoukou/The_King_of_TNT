# 全局玩家状态（任何阶段都跑）
function tkot:states/overall/tick1

#1 无tick1
execute if score #steps int matches 0 run function tkot:states/0/tick1
execute if score #steps int matches 2 run function tkot:states/2/tick1
execute if score #steps int matches 3 run function tkot:states/3/tick1

schedule function tkot:ticks/tick1 1t replace
