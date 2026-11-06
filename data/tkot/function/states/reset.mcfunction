# ── 回合复位 ────────────────────────────────────────────────
# 由 states/3/finish 在地图清理完成后调用一次。
# 注意：#round 是累计局数，绝对不能复位；玩家的 player_win / total.death 是生涯数据，也不复位。

# C1 假玩家分数
scoreboard players set #total_prepare int 0
scoreboard players set #total_player int 0
scoreboard players set #alive_player int 0
scoreboard players set #give_count int 0
scoreboard players set #prepare sec -1
scoreboard players set #temp sec 0
scoreboard players set #max_height int 0
scoreboard players set #map_num int 0
scoreboard players set #reset_timer int 0
scoreboard players set #reset_retry int 0

# C2 玩家单局分数（deathCount 必须用 set，reset 会把这项删掉，scores={death=1..} 就永远不成立了）
scoreboard players set @a death 0

# C3 身份与位置标记：所有人回大厅身份 0
scoreboard players set @a statu 0
tag @a remove in_arena

# C4 调度
schedule clear tkot:states/1/tp
schedule clear tkot:states/2/give_item
schedule clear tkot:states/3/map_returen/step

# C5 storage
data remove storage tkot:temp prepare
data remove storage tkot:temp total
data remove storage tkot:temp sec
data remove storage tkot:temp y

# C6 实体（掉线残留的探针、没炸完的 TNT）
kill @e[tag=tmp_dir]
kill @e[tag=thrown_tnt]
effect clear @a

# C7 玩家状态：回大厅统一用 adventure（想改生存就改这一行）
# 大厅增益（饱和/抗性/生命恢复）由 effects/lobby 每秒刷新，这里不用再补
