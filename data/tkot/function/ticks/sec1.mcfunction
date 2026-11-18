# 掉落物清理：每秒一次就够
# ★ 战斗进行中（#steps == 2）不清理：玩家丢在地上的道具要留到本局结束
execute unless score #steps int matches 2 run function tkot:states/overall/clean

# 职业选择：只在大厅开放
#   读 trigger + 给站台上的人开权限
execute if score #steps int matches 0 as @a[team=!debug,scores={job_trigger=1..4}] run function tkot:jobs/read
execute if score #steps int matches 0 as @a[team=!debug,scores={statu=1}] run scoreboard players enable @s job_trigger

# 开始游戏后就关掉：撤销所有 trigger 权限（reset 会同时清掉分数并禁用 trigger）
#   这样战斗中再点告示牌/按钮会直接被拒，职业锁死到本局结束。
execute unless score #steps int matches 0 run scoreboard players reset @a[team=!debug] job_trigger

execute if score #steps int matches 0 run function tkot:states/0/sec1
execute if score #steps int matches 1 run function tkot:states/1/sec1
execute if score #steps int matches 2 run function tkot:states/2/sec1
execute if score #steps int matches 3 run function tkot:states/3/sec1

schedule function tkot:ticks/sec1 1s replace
