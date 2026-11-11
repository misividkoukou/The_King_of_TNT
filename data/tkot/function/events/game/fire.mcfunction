# ── 该触发事件了 ──
# 由 states/2/sec1 在 #event_fire = 1 时调用。
# 只负责清开关 + 转交给 random（投票/随机的判定都在 random 里）。

scoreboard players set #event_fire int 0
function tkot:events/game/random
