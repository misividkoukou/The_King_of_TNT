# ── 还原"临时事件属性" ──
# 调用方：attr/tick（10 秒到期）、states/reset（回合结束兜底）。
# 上下文 = 玩家。
#
# 按玩家身上的事件标签分发，每个事件只还原本事件改过的东西，
# 这样"御剑飞行"结束时不会顺带把别人的血量上限也重置成 20。
execute as @s[tag=attr_no_gravity] run function tkot:events/game/no_gravity/reset
execute as @s[tag=attr_low_gravity] run function tkot:events/game/low_gravity/reset
execute as @s[tag=attr_poor_health] run function tkot:events/game/poor_health/reset
execute as @s[tag=attr_good_health] run function tkot:events/game/good_health/reset

# 收尾：清掉标记与倒计时（没有对应标签的人也会走到这里，属于正常兜底）
tag @s remove attr_temp
scoreboard players reset @s attr_timer
