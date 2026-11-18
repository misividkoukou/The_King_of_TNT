# ── 自选分组：不足两队时自动改回系统分组 ──
# 由 teams/prepare 在 balance 之后调用。
# 场景：4 个人全站绿队 → 只有 1 支队伍 → 开局 5 秒就判绿队赢，没意义。

function tkot:teams/count

# 统计"有人的队伍数"
scoreboard players set #team_used int 0
execute if score #n_red int matches 1.. run scoreboard players add #team_used int 1
execute if score #n_yellow int matches 1.. run scoreboard players add #team_used int 1
execute if score #n_blue int matches 1.. run scoreboard players add #team_used int 1
execute if score #n_green int matches 1.. run scoreboard players add #team_used int 1

# 0~1 支队 → 回退到系统分组（内部会先 clear 再轮流分配）
execute if score #team_used int matches ..1 run function tkot:teams/assign_system
execute if score #team_used int matches ..1 run tellraw @a [{"text":"[TKOT] 自选分组不足两队，已自动改为","color":"yellow"},{"text":"系统分组","color":"gold"},]
