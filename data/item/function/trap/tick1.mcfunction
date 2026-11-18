# ── 地雷每 tick 逻辑 ──
# 标签流程：arming（埋设中 20 tick）→ active（可踩）→ detonated（已引爆）

# 1. 倒计时递减
execute as @e[type=marker,tag=arming] run scoreboard players remove @s int 1

# 2. 倒计时结束 → 激活
# ★ 顺序不能反：两行条件都是 tag=arming，
#   先 remove arming 的话第二行就匹配不到了，active 永远加不上 → 地雷永远不炸。
execute as @e[type=marker,tag=arming,scores={int=..0}] run tag @s add active
execute as @e[type=marker,tag=arming,scores={int=..0}] run tag @s remove arming

# 3. 检测踩踏（1.2 格内、非创造非旁观）
execute as @e[type=marker,tag=active] at @s if entity @a[gamemode=!creative,gamemode=!spectator,distance=..1.2] run tag @s add detonated
execute as @e[type=marker,tag=active] at @s if entity @a[gamemode=!creative,gamemode=!spectator,distance=..1.2] run tag @s remove active

# 4. 引爆并清除
execute as @e[type=marker,tag=detonated] at @s run summon minecraft:tnt ~ ~ ~ {fuse:0}
execute as @e[type=marker,tag=detonated] run kill @s
