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
# 新一局：先摘掉"已计参与"标记 —— 由 states/1/next_statu 在开战瞬间重新打上。
# 掉线玩家不会走到这里，但他们下次上台时同样会经过这一行，旧标记不会赖着。
tag @a[scores={statu=2}] remove round_counted
# 生涯：参与次数不在这里加 —— 已挪到 states/1/next_statu（真正开战那一刻）。
# 原因：0→1 只是"上台定格"，随后 5 秒开场里如果全员掉线会走 abort，
#       那一局根本没打起来，不该算一次参与。

# 清理准备阶段的计数
scoreboard players set #prepare sec -1
scoreboard players set #total_prepare int 0
scoreboard players set #total_player int 0

# ── 分队 ──
# 模式 1 单人混战：清空队伍；模式 2 系统分组；模式 3 自选分组并平衡
# 必须在 statu=2 之后、spread（state 2）之前完成，出生点分配要用到队伍
function tkot:teams/prepare

# 推进状态机
scoreboard players set #steps int 1

# 每局开始前复位一次大厅：上一局可能被 TNT 炸坏、或有人掉出去留下痕迹。
# 复位成功后 place_lobby 会顺带把所有人 tp 回大厅 —— 此时他们本来就站在准备台上，无副作用。
function tkot:lobby/place_lobby

function tkot:states/1/game_prepare
title @a title {"text":"准备开始","color":"red"}

# 大厅增益由 effects/lobby 负责（准备阶段 states/1/sec1 也会每秒刷新）
