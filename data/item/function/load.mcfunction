# 初始化运算用计分板
# calc_x/y/z 也要先 remove，否则每次 /reload 都会刷“已存在”的报错
scoreboard objectives remove calc_x
scoreboard objectives add calc_x dummy
scoreboard objectives remove calc_y
scoreboard objectives add calc_y dummy
scoreboard objectives remove calc_z
scoreboard objectives add calc_z dummy

# 弹跳 TNT 用的计分板（挂在 TNT 实体上，不是玩家）
#   bounce    ：这颗 TNT 已经弹了几次（上限 3 次）
#   bounce_vy ：本 tick 的竖直速度 ×1000（只在为负 = 下落中时才反弹）
scoreboard objectives remove bounce
scoreboard objectives add bounce dummy
scoreboard objectives remove bounce_vy
scoreboard objectives add bounce_vy dummy


# 每 tick 循环调度：item:tick/tick1 负责瞬爆 TNT 贴地检测 + 飞行羽毛计时
# 每 秒 循环调度：item:tick/sec1 负责治疗池计时
schedule function item:tick/tick1 2t replace
schedule function item:tick/sec1 2t replace
