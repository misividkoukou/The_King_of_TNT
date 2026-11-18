# 把 #next_event 换算成列表下标，取出名字和颜色再播报
scoreboard players operation #vj int = #next_event int
scoreboard players remove #vj int 1
execute store result storage tkot:vote j int 1 run scoreboard players get #vj int

function tkot:events/player/get_entry with storage tkot:vote
function tkot:events/player/say_result with storage tkot:vote
