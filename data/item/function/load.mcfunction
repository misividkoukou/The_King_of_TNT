# 初始化运算用计分板
scoreboard objectives remove calc
scoreboard objectives add calc dummy

# calc_x/y/z 也要先 remove，否则每次 /reload 都会刷“已存在”的报错
scoreboard objectives remove calc_x
scoreboard objectives add calc_x dummy
scoreboard objectives remove calc_y
scoreboard objectives add calc_y dummy
scoreboard objectives remove calc_z
scoreboard objectives add calc_z dummy

# 飞行羽毛的剩余时间（每个玩家一份）
# remove 再 add 是为了 /reload 时把残留计时清掉
scoreboard objectives remove fly_time
scoreboard objectives add fly_time dummy

# 设置 TNT 的初速度倍数（当前无效：速度直接写死在 item:common/aim 的 0.000015 里）
scoreboard players set $speed calc 15

# 每 tick 循环调度：item:tick/tick1 负责瞬爆 TNT 贴地检测 + 飞行羽毛计时
# 每 秒 循环调度：item:tick/sec1 负责治疗池计时
schedule function item:tick/tick1 2t replace
schedule function item:tick/sec1 2t replace
