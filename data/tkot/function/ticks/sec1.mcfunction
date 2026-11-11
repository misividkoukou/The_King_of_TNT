# 掉落物清理：每秒一次就够（原来挂在每 tick 的 overall/tick1 上，是 20 倍的全实体扫描）
# ★ 战斗进行中（#steps == 2）不清理：玩家丢在地上的道具要留到本局结束
#   （原版物品实体 5 分钟后会自然消失，这个不干预）
execute unless score #steps int matches 2 run function tkot:states/overall/clean

execute if score #steps int matches 0 run function tkot:states/0/sec1
execute if score #steps int matches 1 run function tkot:states/1/sec1
execute if score #steps int matches 2 run function tkot:states/2/sec1
execute if score #steps int matches 3 run function tkot:states/3/sec1

schedule function tkot:ticks/sec1 1s replace
