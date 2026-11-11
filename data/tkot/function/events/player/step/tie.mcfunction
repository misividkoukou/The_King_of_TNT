# ── 并列时抽签：数到第 #pick 个并列项（宏）──
$execute if score #event_$(i)_vote int = #vmax int run scoreboard players add #walk int 1
$execute if score #event_$(i)_vote int = #vmax int if score #walk int = #pick int run scoreboard players set #next_event int $(i)

function tkot:events/player/advance
