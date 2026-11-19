# ── 弹跳 TNT：每 tick（由 item:tick/tick1 调用）──
# 贴地检测照抄 instant_tnt/meet_ground：unless block ~ ~-0.1 ~ #minecraft:air
#
# ★ 关键：贴地条件在落地后【每 tick 都成立】，只按贴地计数会瞬间打满上限。
#   所以每 tick 先把 Motion[1] 读进 bounce_vy（放大 1000 倍取整），
#   只有竖直速度为负（还在下落）时才算"一次触地"。
#   反弹后竖直速度变成正数，同一个接触面不会连续触发。
#
# ★ 上限 3 次：第 4 次触地就摘掉 bounce_tnt 标签，退化成普通 TNT 等 fuse 爆炸，
#   避免无限弹跳、也避免回合结束时场上有永远不炸的东西。
#   （清理不用改：它仍然带 thrown_tnt，states/reset 的 kill @e[tag=thrown_tnt] 会清掉）

# 1. 读竖直速度（×1000 取整，避免小数精度问题）
execute as @e[type=minecraft:tnt,tag=bounce_tnt] store result score @s bounce_vy run data get entity @s Motion[1] 1000

# 2. 贴地 + 正在下落 → 计一次触地
execute as @e[type=minecraft:tnt,tag=bounce_tnt] at @s unless block ~ ~-0.1 ~ #minecraft:air if score @s bounce_vy matches ..-1 run scoreboard players add @s bounce 1

# 3. 第 1~3 次触地 → 上弹（0.4 格/刻，够看出来但不能无限叠高）
execute as @e[type=minecraft:tnt,tag=bounce_tnt] at @s unless block ~ ~-0.1 ~ #minecraft:air if score @s bounce_vy matches ..-1 if score @s bounce matches 1..3 run data modify entity @s Motion[1] set value 0.4d

# 4. 第 4 次触地 → 不再弹，退化成普通 TNT
execute as @e[type=minecraft:tnt,tag=bounce_tnt] if score @s bounce matches 4.. run tag @s remove bounce_tnt
