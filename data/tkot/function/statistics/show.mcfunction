# ── 个人战绩面板（上下文 = 玩家）──
# 由 statistics/read 在玩家点击大厅面板时调用。
# rate = 胜场 / 参与 × 100，整数除法（1/3 → 33%）。
# 参与次数为 0 时不做除法，rate 保持 0（新玩家显示 0%，不是报错）。

scoreboard players set #const_100 int 100

# 1. rate = player_win * 100
execute as @s run scoreboard players operation @s rate = @s player_win
execute as @s run scoreboard players operation @s rate *= #const_100 int

# 2. 参与次数 >0 才除以参与次数
execute as @s if score @s player_round matches 1.. run scoreboard players operation @s rate /= @s player_round

# 3. 面板（参与 / 胜利 / 死亡 / 胜率）
tellraw @s ["",{"text":"===== 个人战绩 =====\n","color":"gold","bold":true},{"text":" 参与次数：","color":"gray"},{"score":{"name":"@s","objective":"player_round"},"color":"yellow"},{"text":" 次\n","color":"gray"},{"text":" 胜利次数：","color":"green"},{"score":{"name":"@s","objective":"player_win"},"color":"green"},{"text":" 次\n","color":"gray"},{"text":" 死亡次数：","color":"red"},{"score":{"name":"@s","objective":"total.death"},"color":"red"},{"text":" 次\n","color":"gray"},{"text":" 胜率：","color":"gray"},{"score":{"name":"@s","objective":"rate"},"color":"aqua"},{"text":"%","color":"gray"}]

# 4. 显示完把临时值清掉，别让 rate 看起来像一条"真数据"留在计分板上
scoreboard players set @s rate 0
scoreboard players reset #const_100 int
