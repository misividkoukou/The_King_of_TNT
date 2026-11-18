# ── 读取告示牌的 trigger（上下文 = 点了牌子的玩家）──
# 告示牌 click_event 里写的是：trigger mode_set set 1 / 2 / 3
# trigger 用完会自动取消权限，所以这里处理完要 reset + 让 states/0/sec1 重新 enable。

execute if score @s mode_set matches 1 run function tkot:modes/select_1
execute if score @s mode_set matches 2 run function tkot:modes/select_2
execute if score @s mode_set matches 3 run function tkot:modes/select_3

# 清掉分数（reset 同时会取消 trigger 权限，下一轮由 sec1 重新 enable）
scoreboard players reset @s mode_set
