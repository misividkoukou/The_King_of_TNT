# 战斗中每秒刷新存活人数（顺便当调试信息：能直接看出淘汰判定有没有生效）
execute store result storage tkot:temp alive int 1 run scoreboard players get #alive_player int
execute store result storage tkot:temp total int 1 run scoreboard players get #total_player int
function tkot:states/2/announce with storage tkot:temp
