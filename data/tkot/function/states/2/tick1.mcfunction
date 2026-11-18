# 掉出地图直接处死（只对本局存活玩家生效）
function tkot:states/2/mechanics/height_trace

# 战斗计时：既当“开局宽限”，也用来在结算时诊断“为什么结束得这么快”
scoreboard players add #fight_time int 1

# 存活人数每 tick 重算；本局人数（分母）已由 states/1/next_statu 在开战瞬间定格，
# 这里不再重算 —— 否则中途掉线的人会让分母缩水（结算显示成"存活 1 / 1"）。
scoreboard players set #alive_player int 0
# 生涯：总死亡次数（原来 total.death 从来没累加过）。必须放在改身份之前，只记一次
scoreboard players add @a[scores={statu=2,death=1..}] total.death 1
execute as @a[scores={statu=2,death=1..}] run scoreboard players set @s statu 3

execute as @a[scores={statu=2}] run scoreboard players add #alive_player int 1

# ── 队伍模式：统计"还有活人的队伍数" ──
scoreboard players set #alive_team int 0
execute if entity @a[team=red,scores={statu=2}] run scoreboard players add #alive_team int 1
execute if entity @a[team=yellow,scores={statu=2}] run scoreboard players add #alive_team int 1
execute if entity @a[team=blue,scores={statu=2}] run scoreboard players add #alive_team int 1
execute if entity @a[team=green,scores={statu=2}] run scoreboard players add #alive_team int 1

# ── 结算条件（至少打满 100 tick = 5 秒，避免出生即死 → 立刻结束的死循环）──
# 单人混战：只剩 0~1 人存活
execute if score #gamemode int matches 1 if score #alive_player int matches ..1 if score #fight_time int matches 100.. run function tkot:states/2/next_statu
# 组队模式：只剩 0~1 支队伍有活人（0 是全员掉线的保险）
execute if score #gamemode int matches 2.. if score #alive_team int matches ..1 if score #fight_time int matches 100.. run function tkot:states/2/next_statu
