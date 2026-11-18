# ── 挂载"临时事件属性" ──
# 由各事件的 set / set_gravity 在改完 attribute 之后调用（上下文 = 玩家）。
# 作用：打上 attr_temp 标记 + 开始 200 tick（10 秒）倒计时。
# 真正的还原由 attr/tick 每 tick 递减到 0 时调 attr/reset 完成。
#
# ★ 为什么不用 schedule：
#   1) schedule 出来的函数没有实体上下文，@s 里的 attribute 全部失败 → 属性永远不还原；
#   2) schedule function ... 10s replace 是按函数名去重的，4 个人同时中招时
#      只会保留最后一次调度 → 另外 3 个人根本没有还原机会。
tag @s add attr_temp
scoreboard players set @s attr_timer 200
