# 脆皮五花：血量上限压到 10（半颗心 × 10）
attribute @s max_health base set 10
# 打标记 + 200 tick 倒计时（还原由 attr/tick 驱动）
tag @s add attr_poor_health
function tkot:events/game/attr/arm
