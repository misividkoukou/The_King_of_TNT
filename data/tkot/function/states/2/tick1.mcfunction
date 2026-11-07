# 掉出地图直接处死（只对本局存活玩家生效）
function tkot:states/2/mechanics/height_trace

# 战斗计时：既当“开局宽限”，也用来在结算时诊断“为什么结束得这么快”
scoreboard players add #fight_time int 1

# 每 tick 重新计数（先清零再累加）
scoreboard players set #total_player int 0
scoreboard players set #alive_player int 0
# 生涯：总死亡次数（原来 total.death 从来没累加过）。必须放在改身份之前，只记一次
scoreboard players add @a[scores={statu=2,death=1..}] total.death 1
execute as @a[scores={statu=2,death=1..}] run scoreboard players set @s statu 3

# 本局人数 = 存活(2) + 已淘汰(3)
execute as @a[scores={statu=2..3}] run scoreboard players add #total_player int 1
execute as @a[scores={statu=2}] run scoreboard players add #alive_player int 1

# 只剩 0~1 人存活 → 结算（0 人是全员掉线的保险）
# 至少打满 100 tick（5 秒）才允许结算：避免“出生即死 → 立刻结束 → 又开一局”的死循环
execute if score #alive_player int matches ..1 if score #fight_time int matches 100.. run function tkot:states/2/next_statu
