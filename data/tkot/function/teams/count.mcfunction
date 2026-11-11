# ── 统计各队人数 / 最大队 / 最小队 ──
# 只统计"本局参战者"：statu=1（准备中）或 statu=2（已上场）
#
# ★ 最小队只在【人数 ≥1 的队伍】里选：
#   否则玩家只选了两队时，"最小队"会是没人的第三/第四队，
#   balance 就会把人硬塞进空队伍 → 变成强制四队。

scoreboard players set #n_red int 0
scoreboard players set #n_yellow int 0
scoreboard players set #n_blue int 0
scoreboard players set #n_green int 0
execute as @a[team=red,scores={statu=1..2}] run scoreboard players add #n_red int 1
execute as @a[team=yellow,scores={statu=1..2}] run scoreboard players add #n_yellow int 1
execute as @a[team=blue,scores={statu=1..2}] run scoreboard players add #n_blue int 1
execute as @a[team=green,scores={statu=1..2}] run scoreboard players add #n_green int 1

# ── 最大队 → #mx / #mx_id ──
# 必须先算 #gt 再改 #mx，否则"改完 #mx 再用它做条件"会失效
scoreboard players set #mx int -1
scoreboard players set #mx_id int 0

scoreboard players set #gt int 0
execute if score #n_red int > #mx int run scoreboard players set #gt int 1
execute if score #gt int matches 1 run scoreboard players operation #mx int = #n_red int
execute if score #gt int matches 1 run scoreboard players set #mx_id int 1

scoreboard players set #gt int 0
execute if score #n_yellow int > #mx int run scoreboard players set #gt int 1
execute if score #gt int matches 1 run scoreboard players operation #mx int = #n_yellow int
execute if score #gt int matches 1 run scoreboard players set #mx_id int 2

scoreboard players set #gt int 0
execute if score #n_blue int > #mx int run scoreboard players set #gt int 1
execute if score #gt int matches 1 run scoreboard players operation #mx int = #n_blue int
execute if score #gt int matches 1 run scoreboard players set #mx_id int 3

scoreboard players set #gt int 0
execute if score #n_green int > #mx int run scoreboard players set #gt int 1
execute if score #gt int matches 1 run scoreboard players operation #mx int = #n_green int
execute if score #gt int matches 1 run scoreboard players set #mx_id int 4

# ── 最小队 → #mn / #mn_id（只看有人的队）──
scoreboard players set #mn int 99
scoreboard players set #mn_id int 0

scoreboard players set #gt int 0
execute if score #n_red int matches 1.. if score #n_red int < #mn int run scoreboard players set #gt int 1
execute if score #gt int matches 1 run scoreboard players operation #mn int = #n_red int
execute if score #gt int matches 1 run scoreboard players set #mn_id int 1

scoreboard players set #gt int 0
execute if score #n_yellow int matches 1.. if score #n_yellow int < #mn int run scoreboard players set #gt int 1
execute if score #gt int matches 1 run scoreboard players operation #mn int = #n_yellow int
execute if score #gt int matches 1 run scoreboard players set #mn_id int 2

scoreboard players set #gt int 0
execute if score #n_blue int matches 1.. if score #n_blue int < #mn int run scoreboard players set #gt int 1
execute if score #gt int matches 1 run scoreboard players operation #mn int = #n_blue int
execute if score #gt int matches 1 run scoreboard players set #mn_id int 3

scoreboard players set #gt int 0
execute if score #n_green int matches 1.. if score #n_green int < #mn int run scoreboard players set #gt int 1
execute if score #gt int matches 1 run scoreboard players operation #mn int = #n_green int
execute if score #gt int matches 1 run scoreboard players set #mn_id int 4
