# 召唤一颗带 bounce_tnt 标签的 TNT（由 bounce_tnt/throw_tnt 调用一次）
# ★ fuse 给到 80 tick（4 秒），比普通弹的 60 长：一次完整弹跳（上 0.45 → 落回）约 20 tick，
#   3 次弹跳要 60 tick 出头，用 60 会在第 3 次弹起前就炸，看起来"只弹了两下"。
$summon minecraft:tnt ~ ~1.62 ~ {Tags:["thrown_tnt","bounce_tnt"],fuse:80,Motion:[$(mx)d,$(my)d,$(mz)d]}
# 给最近的那颗 TNT 记上主人（data modify entity 只接受单个实体，所以必须 limit=1）
data modify entity @e[type=minecraft:tnt,tag=thrown_tnt,limit=1,sort=nearest] owner set from entity @s UUID
