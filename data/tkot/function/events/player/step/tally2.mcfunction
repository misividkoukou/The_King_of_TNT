# ── 统计第 2 轮：并列数量（宏）──
$execute if score #event_$(i)_vote int = #vmax int run scoreboard players add #ties int 1

function tkot:events/player/advance
