# ── 状态 1（开场）→ 2（战斗）──

# 兜底：本局玩家已经全部消失（掉线/被重置）就直接中止，不再进入空局
execute unless entity @a[scores={statu=2}] run return run function tkot:states/abort

scoreboard players set #steps int 2
effect clear @a

# 战斗阶段开放 PVP（大厅阶段是关的）
gamerule pvp true

scoreboard players set #temp sec 0
scoreboard players set #prepare sec -1

data remove storage tkot:temp sec
data remove storage tkot:temp prepare
data remove storage tkot:temp total

# 战斗开始前重置单局数据；身份不用动，statu=2 就是“本局存活”
scoreboard players set @a death 0
scoreboard players set #fight_time int 0

function tkot:states/2/choose_map