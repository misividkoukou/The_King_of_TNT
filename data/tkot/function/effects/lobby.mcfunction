# 大厅 / 准备阶段的增益（每秒刷新一次）
#   saturation    补满饥饿值
#   resistance    抗性 V = 100% 减伤。不要用 absorption：它给的是额外血量，被打光后不会回满
#   regeneration  生命恢复 III，快速回血
#
# 时长写 30 秒而不是 2 秒：效果图标在剩余时间不足 10 秒时会闪烁，
# 每秒刷新一次、时长久一点，图标就一直是稳定的。
#
# 只在“大厅 + 准备”阶段生效；进入战斗时 states/1/next_statu 会 effect clear 清掉。

effect give @a saturation 30 0 true
effect give @a resistance 30 4 true
effect give @a regeneration 30 2 true
effect give @a night_vision 30 1 true