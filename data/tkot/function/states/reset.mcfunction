# ── 回合复位 ────────────────────────────────────────────────
# 由 states/3/finish 在地图清理完成后调用一次。
# 注意：#round 是累计局数，绝对不能复位；玩家的 player_win / total.death 是生涯数据，也不复位。
worldborder center 0.0 0.0
worldborder set 59999968


# C1 假玩家分数

# ★ 必须用 set 0，不能用 reset！
#   reset 会把这条计分「删掉」，之后 roll_core 里的 matches 判断全部不成立，
#   随机事件会被整段跳过、#events 保留上一次的旧值 → 下一局一开始就重放旧事件
#   （上一局最后是边界收缩的话，新局 30 秒就会缩圈）。
scoreboard players set #game_min_timer int 0
scoreboard players set #game_sec_timer int 0
scoreboard players set #game_event_timer int 0
scoreboard players set #total_prepare int 0
scoreboard players set #total_player int 0
scoreboard players set #alive_player int 0
scoreboard players set #prepare sec -1
scoreboard players set #temp sec 0
scoreboard players set #max_height int 0
scoreboard players set #map_num int 0
scoreboard players set #reset_timer int 0
scoreboard players set #reset_retry int 0
# 结算延迟开关必须归零，否则下一局开局时 sec1/tick1 会一直被门控住
scoreboard players set #over_wait int 0

# 事件投票 / 事件开关
scoreboard players set #vote_ready int 0
scoreboard players set #vote_total int 0
scoreboard players set #vmax int 0
scoreboard players set #ties int 0
scoreboard players set #next_event int 0
scoreboard players set #walk int 0
scoreboard players set #pick int 0
scoreboard players set #event_fire int 0
scoreboard players set #cancel_cd int 0
# 本轮是否开放过投票（50% 概率）+ 边界是否已到最小（禁止再抽到边界收缩）
scoreboard players set #vote_opened int 0
scoreboard players set #vote_roll int 0
scoreboard players set #rollmax int 0
# 边界"耗尽"标记 / 边界事件编号 / 上次读到的边界尺寸
scoreboard players set #border_dead int 0
scoreboard players set #border_id int 0
scoreboard players set #border_range int 0
# 投票上限相关（每次 close 会重新计算，这里只是兜底归零）
scoreboard players set #vote_early int 0
scoreboard players set #vote_max int 0
scoreboard players set #unlock int 0
# 各事件票数按事件表清零（宏循环，不需要按事件逐个写）
data modify storage tkot:vote step set value "tkot:events/player/step/reset"
function tkot:events/player/run
scoreboard players reset @a vote

# C2 玩家单局分数（deathCount 必须用 set，reset 会把这项删掉，scores={death=1..} 就永远不成立了）
scoreboard players set @a death 0

# C3 身份与位置标记：所有人回大厅身份 0
scoreboard players set @a statu 0
tag @a remove in_arena

# C3.5 队伍：回合结束全部退队（下一局重新选/重新分），并清掉统计用的假玩家
team leave @a[team=!debug]
tag @a remove tm_done
scoreboard players set #n_red int 0
scoreboard players set #n_yellow int 0
scoreboard players set #n_blue int 0
scoreboard players set #n_green int 0
scoreboard players set #mx int 0
scoreboard players set #mx_id int 0
scoreboard players set #mn int 0
scoreboard players set #mn_id int 0
scoreboard players set #diff int 0
scoreboard players set #gt int 0
scoreboard players set #ti int 0
scoreboard players set #iter int 0
scoreboard players set #team_used int 0
scoreboard players set #alive_team int 0

# C4 调度
schedule clear tkot:states/2/give_item
schedule clear tkot:states/3/map_returen/step

# C5 storage
data remove storage tkot:temp prepare
data remove storage tkot:temp total
data remove storage tkot:temp sec
# 清空临时坐标表（{} 表示整张表，是合法写法）
data remove storage tnt:spawn {}

# C6 实体（掉线残留的探针、没炸完的 TNT、地上丢的道具、没触发的地雷）
kill @e[tag=tmp_dir]
kill @e[tag=thrown_tnt]
kill @e[type=marker,tag=trap]
# 战斗期间不清理掉落物（见 ticks/sec1），所以回合结束时在这里统一清
kill @e[type=item]
effect clear @a

# C7 玩家状态：回大厅统一用 adventure（想改生存就改这一行）
# 大厅增益（饱和/抗性/生命恢复）由 effects/lobby 每秒刷新，这里不用再补
gamerule pvp false
gamerule spawn_monsters false
# 兜底：如果这一局有人用了飞行羽毛还没到期，回合结束必须把重力还原，
# 否则负重力会跟着人进大厅/下一局
execute as @a run attribute @s minecraft:gravity base reset
# 回合复位时也清空背包（任何路径经过 reset 都不会把道具留在大厅）
clear @a
