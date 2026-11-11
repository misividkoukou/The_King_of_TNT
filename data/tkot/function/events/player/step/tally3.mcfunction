# ── 统计第 3 轮：唯一最高时直接定案（宏）──
$execute if score #ties int matches 1 if score #event_$(i)_vote int = #vmax int run scoreboard players set #next_event int $(i)

function tkot:events/player/advance
