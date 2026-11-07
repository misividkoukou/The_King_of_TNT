$summon minecraft:tnt ~ ~1.62 ~ {Tags:["thrown_tnt"],fuse:60,Motion:[$(mx)d,$(my)d,$(mz)d]}
# 给最近的那颗 TNT 记上主人（UUID 数组直接复制；这个字段游戏不认识，只会存在内存里）
# 统一用 thrown_tnt 标签：states/reset 的清理、common/aim 之后的 owner 写入都靠它
data modify entity @e[type=minecraft:tnt,tag=thrown_tnt,limit=1,sort=nearest] owner set from entity @s UUID
