# 胜利结算：本局存活者（statu=2）各 +1 胜场
scoreboard players add @a[scores={statu=2}] player_win 1

# 诊断：本局是正常打完，还是开局就全死了
#   用时 ≈ 100 tick（5 秒）= 触发宽限后立刻结算 → 说明开场就没活人了，多半是出生点/场地问题
tellraw @a [{"text":"[TKOT] 结算：存活 "},{"score":{"name":"#alive_player","objective":"int"},"color":"red"},{"text":" / "},{"score":{"name":"#total_player","objective":"int"},"color":"white"},{"text":"，用时 "},{"score":{"name":"#fight_time","objective":"int"},"color":"aqua"},{"text":" tick","color":"gray"}]

# 推进状态机；statu 先不动，结算画面还要用它列出胜利者
scoreboard players set #steps int 3
function tkot:states/3/next_statu

# 大厅增益交给 effects/lobby，这里不再给吸收（吸收的心被打光后不会回满，容易误判）
