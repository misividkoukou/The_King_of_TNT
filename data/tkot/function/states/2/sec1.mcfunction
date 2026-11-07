# 战斗中每秒刷新存活人数（顺便当调试信息：能直接看出淘汰判定有没有生效）
execute store result storage tkot:temp alive int 1 run scoreboard players get #alive_player int
execute store result storage tkot:temp total int 1 run scoreboard players get #total_player int
function tkot:states/2/announce with storage tkot:temp

execute if score #steps int matches 2 run scoreboard players add #game_sec_timer int 1
execute if score #steps int matches 2 run scoreboard players add #game_event_timer int 1
execute if score #steps int matches 2 if score #game_sec_timer int matches 60 run scoreboard players add #game_min_timer int 1
execute if score #steps int matches 2 if score #game_sec_timer int matches 60 run scoreboard players set #game_sec_timer int 0

# 缩圈：每分钟的第 59 秒判一次，由 statu_judge 按当前边界大小决定下一步
# 写成 matches 1.. 而不是 1/2/3：链条 26→20→15→10→5 需要 5 次触发，
# 只写 1/2/3 的话缩到 10 就断了，to5 和 end 永远走不到。
execute if score #game_min_timer int matches 1.. if score #game_sec_timer int matches 59 run function tkot:events/game/border/statu_judge

execute if score #game_event_timer int matches 20 run function tkot:events/game/random
execute if score #game_event_timer int matches 20 run scoreboard players reset #game_event_timer