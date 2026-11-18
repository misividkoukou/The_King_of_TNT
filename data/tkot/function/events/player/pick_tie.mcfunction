# ── 并列时随机抽一个（宏）──
# 宏参数：$(ties) = 并列的事件个数
# 抽第 #pick 个并列项：step/tie 会把并列项按编号数一遍，命中第 #pick 个就定案。

$execute store result score #pick int run random value 1..$(ties)

scoreboard players set #walk int 0

data modify storage tkot:vote step set value "tkot:events/player/step/tie"
function tkot:events/player/run
