# 平衡的一步：找出最大队和最小队，差 ≥ 2 就挪一个人过去，然后递归。
scoreboard players add #iter int 1

function tkot:teams/count

# 差距
scoreboard players operation #diff int = #mx int
scoreboard players operation #diff int -= #mn int

# 已经平衡 或 迭代超限 → 停
execute if score #diff int matches ..1 run return 0
execute if score #iter int matches 9.. run return 0

# 把"从哪队挪到哪队"写成字符串，交给 macro 执行
execute if score #mx_id int matches 1 run data modify storage tkot:team from set value "red"
execute if score #mx_id int matches 2 run data modify storage tkot:team from set value "yellow"
execute if score #mx_id int matches 3 run data modify storage tkot:team from set value "blue"
execute if score #mx_id int matches 4 run data modify storage tkot:team from set value "green"

execute if score #mn_id int matches 1 run data modify storage tkot:team to set value "red"
execute if score #mn_id int matches 2 run data modify storage tkot:team to set value "yellow"
execute if score #mn_id int matches 3 run data modify storage tkot:team to set value "blue"
execute if score #mn_id int matches 4 run data modify storage tkot:team to set value "green"

function tkot:teams/move with storage tkot:team

function tkot:teams/balance_step
