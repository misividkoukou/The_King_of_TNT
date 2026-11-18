# 增生药剂：血量上限提到 30，并立刻补满
attribute @s max_health base set 30
# ★ 用 @s 而不是 @p：@p 是"离命令源最近的人"，可能治到别人身上
effect give @s minecraft:instant_health 1 255
# 打标记 + 200 tick 倒计时（还原由 attr/tick 驱动）
tag @s add attr_good_health
function tkot:events/game/attr/arm
