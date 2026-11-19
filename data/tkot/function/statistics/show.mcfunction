# ── 个人战绩面板（上下文 = 玩家）──
# 由 statistics/read 在玩家点击大厅面板时调用。
# rate = 胜场 / 参与 × 100，整数除法（1/3 → 33%）。
# 参与次数为 0 时不做除法，rate 保持 0（新玩家显示 0%，不是报错）。
#
# kd = 总击杀 / 总死亡 × 100，同样用整数除法（临时值，显示完清零）。
# ★ 总死亡为 0 时不做除法（除零），直接把击杀数当结果显示，并在面板上注明口径。
# ★ Tab 槽位只留给生命值（见 config/health_on），击杀与 KD 只在这里看。

scoreboard players set #const_100 int 100

# 1. rate = player_win * 100
execute as @s run scoreboard players operation @s rate = @s player_win
execute as @s run scoreboard players operation @s rate *= #const_100 int

# 2. 参与次数 >0 才除以参与次数
execute as @s if score @s player_round matches 1.. run scoreboard players operation @s rate /= @s player_round

# 3. kd 先直接放"击杀数"：这同时就是 total.death = 0 时的最终显示值
execute as @s run scoreboard players operation @s kd = @s total.kill

# 4. 有死亡记录才换算成百分比：kd = total.kill * 100 / total.death
execute as @s if score @s total.death matches 1.. run scoreboard players operation @s kd *= #const_100 int
execute as @s if score @s total.death matches 1.. run scoreboard players operation @s kd /= @s total.death

# 5. 面板（参与 / 胜利 / 死亡 / 总击杀 / 胜率 / KD）
#    两个分支只差最后一项：有死亡显示 KD%，没死亡则显示击杀数并注明口径。
execute as @s if score @s total.death matches 1.. run tellraw @s ["",{"text":"===== 个人战绩 =====\n","color":"gold","bold":true},{"text":" 参与次数：","color":"gray"},{"score":{"name":"@s","objective":"player_round"},"color":"yellow"},{"text":" 次\n","color":"gray"},{"text":" 胜利次数：","color":"green"},{"score":{"name":"@s","objective":"player_win"},"color":"green"},{"text":" 次\n","color":"gray"},{"text":" 死亡次数：","color":"red"},{"score":{"name":"@s","objective":"total.death"},"color":"red"},{"text":" 次\n","color":"gray"},{"text":" 总击杀：","color":"gray"},{"score":{"name":"@s","objective":"total.kill"},"color":"aqua"},{"text":" 次\n","color":"gray"},{"text":" 胜率：","color":"gray"},{"score":{"name":"@s","objective":"rate"},"color":"aqua"},{"text":"%\n","color":"gray"},{"text":" KD：","color":"gray"},{"score":{"name":"@s","objective":"kd"},"color":"aqua"},{"text":"%","color":"gray"}]
execute as @s unless score @s total.death matches 1.. run tellraw @s ["",{"text":"===== 个人战绩 =====\n","color":"gold","bold":true},{"text":" 参与次数：","color":"gray"},{"score":{"name":"@s","objective":"player_round"},"color":"yellow"},{"text":" 次\n","color":"gray"},{"text":" 胜利次数：","color":"green"},{"score":{"name":"@s","objective":"player_win"},"color":"green"},{"text":" 次\n","color":"gray"},{"text":" 死亡次数：","color":"red"},{"score":{"name":"@s","objective":"total.death"},"color":"red"},{"text":" 次\n","color":"gray"},{"text":" 总击杀：","color":"gray"},{"score":{"name":"@s","objective":"total.kill"},"color":"aqua"},{"text":" 次\n","color":"gray"},{"text":" 胜率：","color":"gray"},{"score":{"name":"@s","objective":"rate"},"color":"aqua"},{"text":"%\n","color":"gray"},{"text":" KD：","color":"gray"},{"score":{"name":"@s","objective":"kd"},"color":"aqua"},{"text":"（暂无死亡，按击杀数计）","color":"gray"}]

# 6. 显示完把临时值清掉，别让 rate / kd 看起来像一条"真数据"留在计分板上
scoreboard players set @s rate 0
scoreboard players set @s kd 0
scoreboard players reset #const_100 int
