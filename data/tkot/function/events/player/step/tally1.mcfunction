# ── 统计第 1 轮：总票数 + 最高票（宏）──
$scoreboard players operation #vote_total int += #event_$(i)_vote int
$scoreboard players operation #vmax int > #event_$(i)_vote int

function tkot:events/player/advance
