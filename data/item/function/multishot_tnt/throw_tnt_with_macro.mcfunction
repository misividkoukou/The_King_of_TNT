# 召唤单颗（由 multishot_tnt/throw_tnt 调用 3 次，每次带着不同的 mx/my/mz）
# 数值与普通弹一致：fuse:60（3 秒）
$summon minecraft:tnt ~ ~1.62 ~ {Tags:["thrown_tnt","multishot_tnt"],fuse:60,Motion:[$(mx)d,$(my)d,$(mz)d]}

# data modify entity 只接受【单个】实体，所以必须 limit=1，一次只记一颗。
# 由 throw_tnt 循环调用 3 次 → 三颗各自记上主人。
data modify entity @e[type=minecraft:tnt,tag=multishot_tnt,sort=nearest,limit=1] owner set from entity @s UUID
