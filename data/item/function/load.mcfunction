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

# 设置 TNT 的初速度倍数 (15 代表 1.5 格/刻，你可以自己改)
scoreboard players set $speed calc 15


schedule function item:tick/tick1 1t replace