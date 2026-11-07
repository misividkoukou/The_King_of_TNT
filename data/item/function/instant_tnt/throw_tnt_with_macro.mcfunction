$summon minecraft:tnt ~ ~1.62 ~ {Tags:["thrown_tnt","instant_explode_tnt"],fuse:60,Motion:[$(mx)d,$(my)d,$(mz)d]}
# 给最近的那颗 TNT 记上主人（UUID 数组直接复制；这个字段游戏不认识，只会存在内存里）
# thrown_tnt：让 states/reset 能清理、owner 能写入
# instant_explode_tnt：让 instant_tnt/meet_ground 每 tick 检测是否贴地，贴地就把 fuse 改成 1
data modify entity @e[type=minecraft:tnt,tag=thrown_tnt,limit=1,sort=nearest] owner set from entity @s UUID
