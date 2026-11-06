# 胜利结算：本局存活者（statu=2）各 +1 胜场
scoreboard players add @a[scores={statu=2}] player_win 1

# 推进状态机；statu 先不动，结算画面还要用它列出胜利者
scoreboard players set #steps int 3
function tkot:states/3/next_statu

# 大厅增益交给 effects/lobby，这里不再给吸收（吸收的心被打光后不会回满，容易误判）