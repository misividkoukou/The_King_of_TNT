# 月球漫步：重力极低 + 摔不死
attribute @s minecraft:gravity base set 0.01
attribute @s minecraft:safe_fall_distance base set 1000
# 打标记 + 200 tick 倒计时（还原由 attr/tick 驱动）
tag @s add attr_low_gravity
function tkot:events/game/attr/arm
