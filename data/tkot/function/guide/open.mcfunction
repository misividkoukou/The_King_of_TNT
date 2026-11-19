# ── 打开图鉴（上下文 = 点了按钮的玩家）──
# 由 guide/tick1 调用。
# /dialog show 需要权限等级 2，玩家自己输不了；但在这里执行时是服务端权限，
# 所以非 OP 玩家也能看到窗口。trigger 只负责把"玩家点击"传进来。
dialog show @s tkot:guide_main

# trigger 一次性语义：reset 同时清分数和权限，下一 tick 由 guide/tick1 重新 enable
scoreboard players reset @s guide_trigger
