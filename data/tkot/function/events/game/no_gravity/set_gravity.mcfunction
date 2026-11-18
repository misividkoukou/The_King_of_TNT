# 御剑飞行：重力归零
attribute @s minecraft:gravity base set 0
# 打标记 + 200 tick 倒计时（还原由 attr/tick 驱动，不用 schedule —— 那里没有实体上下文）
tag @s add attr_no_gravity
function tkot:events/game/attr/arm
