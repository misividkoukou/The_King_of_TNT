# ── 个人战绩面板（上下文 = 玩家）──
# 由 statistics/read 在玩家点击大厅面板（或大厅综合菜单的 [ 战绩 ]）时调用。
# rate = 胜场 / 参与 × 100，整数除法（1/3 → 33%）。
# 参与次数为 0 时不做除法，rate 保持 0（新玩家显示 0%，不是报错）。
#
# K/D = 总击杀 ÷ 总死亡，保留一位小数（2.3 这种），由 statistics/kd 计算：
#   kd = 整数部分、kd_frac = 小数部分。
# ★ 总死亡为 0 时不做除法（除零），面板显示 "—（暂无死亡）"。
# ★ Tab 槽位只留给生命值（见 config/health_on），击杀与 K/D 只在这里看。

scoreboard players set #const_100 int 100
scoreboard players set #const_10 int 10

# 1. rate = player_win * 100
execute as @s run scoreboard players operation @s rate = @s player_win
execute as @s run scoreboard players operation @s rate *= #const_100 int

# 2. 参与次数 >0 才除以参与次数
execute as @s if score @s player_round matches 1.. run scoreboard players operation @s rate /= @s player_round

# 3. K/D：一位小数，拆成 kd 与 kd_frac
function tkot:statistics/kd

# 4. 面板（参与 / 胜利 / 死亡 / 总击杀 / 胜率 / K/D）
#    两个分支只差最后一项：有死亡显示 kd.kd_frac，没死亡显示 "—"。
execute as @s if score @s total.death matches 1.. run tellraw @s ["",{"text":"===== 个人战绩 =====\n","color":"gold","bold":true},{"text":" 参与次数：","color":"gray"},{"score":{"name":"@s","objective":"player_round"},"color":"yellow"},{"text":" 次\n","color":"gray"},{"text":" 胜利次数：","color":"green"},{"score":{"name":"@s","objective":"player_win"},"color":"green"},{"text":" 次\n","color":"gray"},{"text":" 死亡次数：","color":"red"},{"score":{"name":"@s","objective":"total.death"},"color":"red"},{"text":" 次\n","color":"gray"},{"text":" 总击杀：","color":"gray"},{"score":{"name":"@s","objective":"total.kill"},"color":"aqua"},{"text":" 次\n","color":"gray"},{"text":" 胜率：","color":"gray"},{"score":{"name":"@s","objective":"rate"},"color":"aqua"},{"text":"%\n","color":"gray"},{"text":" K/D：","color":"gray"},{"score":{"name":"@s","objective":"kd"},"color":"aqua"},{"text":".","color":"gray"},{"score":{"name":"@s","objective":"kd_frac"},"color":"aqua"}]
execute as @s unless score @s total.death matches 1.. run tellraw @s ["",{"text":"===== 个人战绩 =====\n","color":"gold","bold":true},{"text":" 参与次数：","color":"gray"},{"score":{"name":"@s","objective":"player_round"},"color":"yellow"},{"text":" 次\n","color":"gray"},{"text":" 胜利次数：","color":"green"},{"score":{"name":"@s","objective":"player_win"},"color":"green"},{"text":" 次\n","color":"gray"},{"text":" 死亡次数：","color":"red"},{"score":{"name":"@s","objective":"total.death"},"color":"red"},{"text":" 次\n","color":"gray"},{"text":" 总击杀：","color":"gray"},{"score":{"name":"@s","objective":"total.kill"},"color":"aqua"},{"text":" 次\n","color":"gray"},{"text":" 胜率：","color":"gray"},{"score":{"name":"@s","objective":"rate"},"color":"aqua"},{"text":"%\n","color":"gray"},{"text":" K/D：","color":"gray"},{"text":"—","color":"dark_gray"},{"text":"（暂无死亡）","color":"gray"}]

# 5. 显示完把临时值清掉，别让 rate / kd / kd_frac 看起来像"真数据"留在计分板上
scoreboard players set @s rate 0
scoreboard players set @s kd 0
scoreboard players set @s kd_frac 0
scoreboard players reset #const_100 int
scoreboard players reset #const_10 int
