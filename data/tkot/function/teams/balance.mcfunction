# ── 模式 3：自选分组之后做平衡 ──
# 玩家已经站在红/黄/蓝/绿混凝土上自己选好队了（states/0/pad/*），
# 这里把人数差 > 1 的队往人少的队挪人，直到差距 ≤ 1。

tag @a[team=!debug] remove tm_done
scoreboard players set #iter int 0
function tkot:teams/balance_step
