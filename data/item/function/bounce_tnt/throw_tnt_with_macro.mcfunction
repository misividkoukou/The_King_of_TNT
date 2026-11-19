# 召唤一颗带 bounce_tnt 标签的 TNT（由 bounce_tnt/throw_tnt 调用一次）
# fuse 与普通弹一致：60 tick = 3 秒
$summon minecraft:tnt ~ ~1.62 ~ {Tags:["thrown_tnt","bounce_tnt"],fuse:60,Motion:[$(mx)d,$(my)d,$(mz)d]}
# 给最近的那颗 TNT 记上主人（data modify entity 只接受单个实体，所以必须 limit=1）
data modify entity @e[type=minecraft:tnt,tag=thrown_tnt,limit=1,sort=nearest] owner set from entity @s UUID
