# 战斗中每秒刷新存活人数（顺便当调试信息：能直接看出淘汰判定有没有生效）
execute store result storage tkot:temp alive int 1 run scoreboard players get #alive_player int
execute store result storage tkot:temp total int 1 run scoreboard players get #total_player int
function tkot:states/2/announce with storage tkot:temp

execute if score #steps int matches 2 run scoreboard players add #game_sec_timer int 1
execute if score #steps int matches 2 run scoreboard players add #game_event_timer int 1
execute if score #steps int matches 2 if score #game_sec_timer int matches 60 run scoreboard players add #game_min_timer int 1
execute if score #steps int matches 2 if score #game_sec_timer int matches 60 run scoreboard players set #game_sec_timer int 0

# 随机事件倒计时：#left = 20 - 当前秒数，只在正好剩 5 秒时提示一次       
        ##调试事件间隔时间在这里
scoreboard players set #left int 30
execute if score #game_event_timer int matches 1.. run scoreboard players operation #left int -= #game_event_timer int
#5秒判定移植到这里
function tkot:events/game/announce

# 缩圈已经改成"事件制"（events/player/table.mcfunction 里的第 6 项），
# 由 events/game/random 统一分发；前 5 分钟事件池只有 1..early，抽不到缩圈。
# ★ 这里原来还有一行"每分钟第 59 秒无条件 statu_judge"，它绕过了事件系统，
#   导致缩圈提前发生且不受 5 分钟限制 —— 已删除。不要再加回来。


        ##调试事件间隔时间在这里
execute if score #game_event_timer int matches 30.. run scoreboard players set #event_fire int 1
execute if score #game_event_timer int matches 30.. run scoreboard players set #game_event_timer int 0

# #event_fire 是"该触发事件了"的开关。
# 以前它只被置 1、没有任何地方读取，所以事件其实一直不会触发（投票也就无从生效）。
# 这里消费它：投票结果 / 随机的判定都在 events/game/random 里。
execute if score #event_fire int matches 1 run function tkot:events/game/fire
