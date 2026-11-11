# ── 状态 0：大厅准备（每秒一次）──

# 0. 大厅保命
#    spawnpoint：摔死后重生在大厅，而不是重生到可能已经清空的世界出生点（否则会无限掉虚空）
#    坐标要和 lobby/tp_point.mcfunction 保持一致（那里是唯一的传送点定义）
#    增益：饱和 + 抗性 V + 生命恢复 III（详见 effects/lobby）
execute if score #lobby_ok int matches 1 run spawnpoint @a 1 -55 224
# 增益不依赖大厅是否放成功：即使大厅结构没加载，抗性也要在，否则大厅里能互相打死
function tkot:effects/lobby

# 0.1 自检：大厅结构放失败 → tp_point 会整条跳过（这就是"没被传送"的原因）
#     只告诉调试队，每 10 秒最多一次，避免刷屏
execute if score #lobby_ok int matches 0 run scoreboard players add #lobby_warn int 1
execute if score #lobby_ok int matches 1 run scoreboard players set #lobby_warn int 0
execute if score #lobby_warn int matches 10.. as @a[team=debug] run tellraw @s [{"text":"[TKOT] 大厅结构 tkot:lobby 放置失败（#lobby_ok=0），传送点 tp_point 已被跳过。检查结构文件是否在 data/tkot/structure/lobby.nbt，以及区块是否加载。","color":"red"}]
execute if score #lobby_warn int matches 10.. run scoreboard players set #lobby_warn int 0

# 0.5 准备阶段始终保持干净：每秒清一次游戏道具（TNT/治疗池/羽毛/爆炸箭/胡萝卜）
function tkot:items/clear_tnt

# 1. 统计（身份判定已移到 states/0/tick1，那里每 tick 重算 statu，这里只负责数人头）
scoreboard players set #total_prepare int 0
scoreboard players set #total_player int 0
execute as @a[team=!debug,gamemode=!spectator] run scoreboard players add #total_player int 1
execute as @a[scores={statu=1}] run scoreboard players add #total_prepare int 1

# 2. 写进 storage 给 actionbar 用
execute store result storage tkot:temp prepare int 1 run scoreboard players get #total_prepare int
execute store result storage tkot:temp total int 1 run scoreboard players get #total_player int
execute store result storage tkot:temp sec int 1 run scoreboard players get #prepare sec

# 3.5 模式告示牌：读 trigger 并把权限还回去
#     click_event 里的 run_command 对非 OP 玩家会被拒绝，所以牌子要用 trigger：
#       click_event -> trigger mode_set set 1/2/3
#     这里每秒读一次，处理完 reset 掉再 enable，玩家才能继续点。
execute as @a[scores={mode_set=1..3}] run function tkot:modes/read
execute as @a[team=!debug] run scoreboard players enable @s mode_set

# 3. 统一刷一次 actionbar
function tkot:states/0/announce with storage tkot:temp

# 4. 状态机：≥2 人准备就开始 10 秒倒计时，掉到 ≤1 就取消
#    顺序很重要：必须先递减、最后才「起算」。
#    之前起算写在最前面，同一 tick 里紧接着就减了 1，显示会从 9 开始（少一秒）。
execute if score #cancel_cd int matches 1.. run scoreboard players remove #cancel_cd int 1
execute if score #prepare sec matches 1.. if score #total_prepare int matches 2.. run scoreboard players remove #prepare sec 1
execute if score #prepare sec matches 1.. if score #total_prepare int matches ..1 run function tkot:states/0/stop_countdown
execute if score #prepare sec matches 0 run function tkot:states/0/next_statu
execute if score #prepare sec matches ..-1 if score #total_prepare int matches 2.. run scoreboard players set #prepare sec 10
