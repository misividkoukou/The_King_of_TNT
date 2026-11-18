# 读取职业 trigger（上下文 = 点了按钮的玩家）
#
#   trigger job_trigger set 1  → 只给自己重开一次选择面板（不改职业）
#   trigger job_trigger set 2  → 旋风人（job=1）
#   trigger job_trigger set 3  → 炸弹人（job=2）
#   trigger job_trigger set 4  → 无影  （job=3）

execute if score @s job_trigger matches 1 run function tkot:jobs/bar

execute if score @s job_trigger matches 2 run scoreboard players set @s job 1
execute if score @s job_trigger matches 3 run scoreboard players set @s job 2
execute if score @s job_trigger matches 4 run scoreboard players set @s job 3

execute if score @s job_trigger matches 2 run tellraw @s [{"text":"[职业] ","color":"gold"},{"text":"已选择 ","color":"gray"},{"text":"旋风人","color":"aqua","bold":true},{"text":"，开局时发放风弹。","color":"gray"}]
execute if score @s job_trigger matches 3 run tellraw @s [{"text":"[职业] ","color":"gold"},{"text":"已选择 ","color":"gray"},{"text":"炸弹人","color":"red","bold":true},{"text":"，开局时发放 TNT。","color":"gray"}]
execute if score @s job_trigger matches 4 run tellraw @s [{"text":"[职业] ","color":"gold"},{"text":"已选择 ","color":"gray"},{"text":"无影","color":"light_purple","bold":true},{"text":"，开局时发放传送箭。","color":"gray"}]

# 清掉 trigger（reset 同时取消权限，下一轮由 ticks/sec1 重新 enable）
scoreboard players reset @s job_trigger
