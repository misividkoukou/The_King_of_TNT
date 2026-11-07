# 掉落物清理：每秒一次就够（原来挂在每 tick 的 overall/tick1 上，是 20 倍的全实体扫描）
function tkot:states/overall/clean

execute if score #steps int matches 0 run function tkot:states/0/sec1
execute if score #steps int matches 1 run function tkot:states/1/sec1
execute if score #steps int matches 2 run function tkot:states/2/sec1
execute if score #steps int matches 3 run function tkot:states/3/sec1

schedule function tkot:ticks/sec1 1s replace
