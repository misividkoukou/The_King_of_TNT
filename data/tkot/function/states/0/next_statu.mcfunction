# ── 状态 0 → 1：把“准备台上的人”定格成本局玩家 ──
# 这一步原来靠 prepare tag 传递身份，现在改成直接写 statu=2，不会再因为标签时序丢掉整局。

# 没有任何人处于准备状态 → 中止，不再进入空局
execute unless entity @a[scores={statu=1}] run return run function tkot:states/abort

# 清掉上一局残留的标题（结算大字 / actionbar）
title @a clear

playsound entity.villager.yes player @a

# 局数 +1，并把参与者与局号绑定
scoreboard players add #round int 1
scoreboard players set @a[scores={statu=1}] statu 2
scoreboard players operation @a[scores={statu=2}] round = #round int
# 生涯：参与次数（原来 player_round 只在 first_join 设 0，从来没累加过）
scoreboard players add @a[scores={statu=2}] player_round 1

# 清理准备阶段的计数
scoreboard players set #prepare sec -1
scoreboard players set #total_prepare int 0
scoreboard players set #total_player int 0

# 推进状态机
scoreboard players set #steps int 1

# 每局开始前复位一次大厅：上一局可能被 TNT 炸坏、或有人掉出去留下痕迹。
# 复位成功后 place_lobby 会顺带把所有人 tp 回大厅 —— 此时他们本来就站在准备台上，无副作用。
function tkot:lobby/place_lobby

function tkot:states/1/game_prepare
title @a title {"text":"准备开始","color":"red"}

# 大厅增益由 effects/lobby 负责（准备阶段 states/1/sec1 也会每秒刷新）
