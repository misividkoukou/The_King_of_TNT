# ── 状态 1（开场）→ 2（战斗）──

# 兜底：本局玩家已经全部消失（掉线/被重置）就直接中止，不再进入空局
execute unless entity @a[scores={statu=2}] run return run function tkot:states/abort

# 生涯参与次数：放在 abort 检查【之后】—— 这一局真的开打了才计
scoreboard players add @a[scores={statu=2}] player_round 1
# 打"已计参与"标记：掉线重连的人靠它判断"要不要补记"，避免重复 +1
tag @a[scores={statu=2}] add round_counted

# 本局人数定格：结算与 actionbar 的分母用这个值。
# 不能再每 tick 重算 statu 2..3 —— 中途掉线的人会从分母里消失，
# 结算就会显示成"存活 1 / 1"，看起来像单挑。
scoreboard players set #total_player int 0
execute as @a[scores={statu=2}] run scoreboard players add #total_player int 1

scoreboard players set #steps int 2
effect clear @a

# 战斗阶段开放 PVP（大厅阶段是关的）
gamerule pvp true

scoreboard players set #temp sec 0
scoreboard players set #prepare sec -1

data remove storage tkot:temp sec
data remove storage tkot:temp prepare
data remove storage tkot:temp total
# 清空临时坐标表（{} 表示整张表）
data remove storage tnt:spawn {}

# 战斗开始前重置单局数据；身份不用动，statu=2 就是“本局存活”
scoreboard players set @a death 0
scoreboard players set #fight_time int 0

function tkot:states/2/choose_map