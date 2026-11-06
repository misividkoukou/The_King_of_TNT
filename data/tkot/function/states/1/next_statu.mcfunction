# ── 状态 1（开场）→ 2（战斗）──

# 兜底：本局玩家已经全部消失（掉线/被重置）就直接中止，不再进入空局
execute unless entity @a[scores={statu=2}] run return run function tkot:states/abort

schedule clear tkot:states/1/tp
scoreboard players set #steps int 2
effect clear @a

scoreboard players set #temp sec 0
scoreboard players set #prepare sec -1

data remove storage tkot:temp sec
data remove storage tkot:temp prepare
data remove storage tkot:temp total

# 战斗开始前重置单局数据；身份不用动，statu=2 就是“本局存活”
scoreboard players set @a death 0
scoreboard players set #give_count int 0

function tkot:states/2/choose_map

# 注意：这里原本有一句 effect give @a absorption infinite 255，
# 会在开战瞬间给 1024 点吸收 → 战斗中谁也炸不死 → 淘汰永远不触发。
# 大厅/准备的保命已经交给 effects/lobby，战斗阶段不该有任何增益，所以删掉了。