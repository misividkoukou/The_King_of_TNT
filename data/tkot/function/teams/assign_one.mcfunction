# 给一个玩家分队，然后递归处理下一个（上下文：@s = 玩家）
# ★ statu 用 1..2：本函数在 statu 已经是 2 的时候被调用
scoreboard players add #ti int 1
execute if score #ti int matches 5.. run scoreboard players set #ti int 1

execute if score #ti int matches 1 run team join red @s
execute if score #ti int matches 2 run team join yellow @s
execute if score #ti int matches 3 run team join blue @s
execute if score #ti int matches 4 run team join green @s

tag @s add tm_done
execute as @a[team=!debug,scores={statu=1..2},tag=!tm_done,limit=1] run function tkot:teams/assign_one
