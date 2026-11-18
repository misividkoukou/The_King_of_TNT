worldborder center 0.0 0.0
worldborder set 59999968

# ── 胜利结算 ──
# 单人混战：存活者（statu=2）各 +1 胜场
# 组队模式：获胜队伍【全体成员】各 +1（含本局已被淘汰的队友，statu=3）
#   以前只给 statu=2，导致"我死了但队伍赢了"不算胜，
#   团队模式玩家的历史胜率被系统性压低，和"队伍胜利"的直觉也对不上。
#   获胜队 = 唯一还有存活者的那支队（#alive_team=1）；#alive_team=0（全员掉线）时无人得胜。
execute if score #gamemode int matches 1 run scoreboard players add @a[scores={statu=2}] player_win 1
execute if score #gamemode int matches 2.. if score #alive_team int matches 1 if entity @a[team=red,scores={statu=2}] run scoreboard players add @a[team=red,scores={statu=2..3}] player_win 1
execute if score #gamemode int matches 2.. if score #alive_team int matches 1 if entity @a[team=yellow,scores={statu=2}] run scoreboard players add @a[team=yellow,scores={statu=2..3}] player_win 1
execute if score #gamemode int matches 2.. if score #alive_team int matches 1 if entity @a[team=blue,scores={statu=2}] run scoreboard players add @a[team=blue,scores={statu=2..3}] player_win 1
execute if score #gamemode int matches 2.. if score #alive_team int matches 1 if entity @a[team=green,scores={statu=2}] run scoreboard players add @a[team=green,scores={statu=2..3}] player_win 1

# 本局用时：tick → 分:秒（发给所有人）
#   #fight_time 每 tick +1，20 tick = 1 秒
scoreboard players set #c20 int 20
scoreboard players set #c60 int 60
scoreboard players operation #dur_sec int = #fight_time int
scoreboard players operation #dur_sec int /= #c20 int
scoreboard players operation #dur_min int = #dur_sec int
scoreboard players operation #dur_min int /= #c60 int
scoreboard players operation #dur_sec int %= #c60 int

tellraw @a [{"text":"\n"},{"text":"[TKOT] ","color":"gold"},{"text":"本局用时 ","color":"gray"},{"score":{"name":"#dur_min","objective":"int"},"color":"aqua","bold":true},{"text":" 分 ","color":"gray"},{"score":{"name":"#dur_sec","objective":"int"},"color":"aqua","bold":true},{"text":" 秒 ","color":"gray"},{"text":"│ ","color":"dark_gray"},{"text":"存活 ","color":"gray"},{"score":{"name":"#alive_player","objective":"int"},"color":"red"},{"text":" / ","color":"gray"},{"score":{"name":"#total_player","objective":"int"},"color":"white"}]

# 调试队额外看一个原始 tick 数，方便排查"开局就全死"
tellraw @a[team=debug] [{"text":"[TKOT·调试] 结算：存活 "},{"score":{"name":"#alive_player","objective":"int"},"color":"red"},{"text":" / "},{"score":{"name":"#total_player","objective":"int"},"color":"white"},{"text":"，原始用时 "},{"score":{"name":"#fight_time","objective":"int"},"color":"aqua"},{"text":" tick","color":"gray"}]

# 推进状态机；statu 先不动，结算画面还要用它列出胜利者
scoreboard players set #steps int 3
function tkot:states/3/next_statu

# 大厅增益交给 effects/lobby，这里不再给吸收（吸收的心被打光后不会回满，容易误判）
