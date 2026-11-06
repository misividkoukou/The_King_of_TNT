# ── 状态 0：大厅准备（每秒一次）──

# 0. 大厅保命
#    spawnpoint：摔死后重生在大厅，而不是重生到可能已经清空的世界出生点（否则会无限掉虚空）
#    增益：饱和 + 抗性 V + 生命恢复 III（详见 effects/lobby）
execute if score #lobby_ok int matches 1 run spawnpoint @a 6 -55 204
execute if score #lobby_ok int matches 1 run function tkot:effects/lobby

# 1. 身份重置：大厅里所有人先归 0，只有站上准备台的人才被记成 1
scoreboard players set @a statu 0
execute as @a[team=!debug,gamemode=!spectator] at @s if block ~ ~-0.1 ~ green_concrete run function tkot:states/0/player_cacu

# 2. 统计
scoreboard players set #total_prepare int 0
scoreboard players set #total_player int 0
execute as @a[team=!debug,gamemode=!spectator] run scoreboard players add #total_player int 1
execute as @a[scores={statu=1}] run scoreboard players add #total_prepare int 1

# 3. 写进 storage 给 actionbar 用
execute store result storage tkot:temp prepare int 1 run scoreboard players get #total_prepare int
execute store result storage tkot:temp total int 1 run scoreboard players get #total_player int
execute store result storage tkot:temp sec int 1 run scoreboard players get #prepare sec

# 4. 统一刷一次 actionbar
function tkot:states/0/announce with storage tkot:temp

# 5. 状态机：≥2 人准备就开始 10 秒倒计时，掉到 ≤1 就取消
#    顺序很重要：必须先递减、最后才「起算」。
#    之前起算写在最前面，同一 tick 里紧接着就减了 1，显示会从 9 开始（少一秒）。
execute if score #prepare sec matches 1.. if score #total_prepare int matches 2.. run scoreboard players remove #prepare sec 1
execute if score #prepare sec matches 1.. if score #total_prepare int matches ..1 run function tkot:states/0/stop_countdown
execute if score #prepare sec matches 0 run function tkot:states/0/next_statu
execute if score #prepare sec matches ..-1 if score #total_prepare int matches 2.. run scoreboard players set #prepare sec 10
