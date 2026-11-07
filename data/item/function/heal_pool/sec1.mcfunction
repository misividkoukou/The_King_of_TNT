# tick 函数中：
# 增加所有治疗图腾的Age，达到5时销毁(5s存活时间)
scoreboard players add @e[type=armor_stand,tag=heal_pool] int 1

execute as @e[type=armor_stand,tag=heal_pool,scores={int=5}] run function item:heal_pool/kill