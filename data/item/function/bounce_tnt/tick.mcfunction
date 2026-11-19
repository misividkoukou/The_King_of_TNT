# ── 弹跳 TNT：每 tick（由 item:tick/tick1 调用）──
# 贴地判定沿用 instant_tnt/meet_ground：unless block ~ ~-0.1 ~ #minecraft:air
#
# ★ 第一版用「Motion[1] 为负」判断"还在下落"，实测不可靠（弹跳不显著、经常完全不弹）：
#   函数在实体物理之后执行，落地那一 tick 竖直速度往往已经被碰撞清零，
#   于是大部分落地读不到负值 → 直接不弹，表现和普通 TNT 一样。
#
# ★ 现在改成「装填 / 触发」两态，不依赖速度符号：
#   ① 脚下是空气（在空中）→ 装填 bounce_arm=1
#   ② 贴地且已装填       → 记一次弹跳、写竖直速度、清掉装填
#   每次触地只会触发一次；弹起后重新在空中 → 自动装填，于是能连续弹。
#   贴在地面不动时永远不会装填，所以不会"一落地连弹三次"。
#
# ★ 上限 3 次：第 4 次触地就摘掉 bounce_tnt 标签，退化成普通 TNT 等 fuse 爆炸。
#   （清理不用改：它仍然带 thrown_tnt，states/reset 的 kill @e[tag=thrown_tnt] 会清掉）

# 1. 在空中 → 装填
execute as @e[type=minecraft:tnt,tag=bounce_tnt] at @s if block ~ ~-0.1 ~ #minecraft:air run scoreboard players set @s bounce_arm 1

# 2. 贴地 + 已装填 → 记一次弹跳
execute as @e[type=minecraft:tnt,tag=bounce_tnt] at @s unless block ~ ~-0.1 ~ #minecraft:air if score @s bounce_arm matches 1 run scoreboard players add @s bounce 1

# 3. 第 1~3 次触地 → 上弹（0.6 格/刻，约 3 格高：实测 0.45 略矮，抬高一档）
execute as @e[type=minecraft:tnt,tag=bounce_tnt] at @s unless block ~ ~-0.1 ~ #minecraft:air if score @s bounce_arm matches 1 if score @s bounce matches 1..3 run data modify entity @s Motion[1] set value 0.6d

# 4. 消费掉装填状态：同一段贴地期间不会再触发
execute as @e[type=minecraft:tnt,tag=bounce_tnt] at @s unless block ~ ~-0.1 ~ #minecraft:air if score @s bounce_arm matches 1 run scoreboard players set @s bounce_arm 0

# 5. 第 4 次触地 → 不再弹，退化成普通 TNT
execute as @e[type=minecraft:tnt,tag=bounce_tnt] if score @s bounce matches 4.. run tag @s remove bounce_tnt
