$summon minecraft:tnt ~ ~1.62 ~ {Tags:["thrown_tnt"],Fuse:60,Motion:[$(mx)d,$(my)d,$(mz)d]}
# 9. 赋予 Owner 标签 (直接将玩家的 UUID 数组复制给最近的 TNT)
data modify entity @e[type=minecraft:tnt,tag=thrown_tnt,limit=1,sort=nearest] owner set from entity @s UUID