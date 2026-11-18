# ── 大厅统计面板：维护 trigger 权限 + 读取点击（每 tick，由 ticks/tick1 调用）──
# ★ 原来这里写的是 `#state` —— 全包没有任何地方写过这个分数，
#   所以 `if #state=1` 永远不成立，lobby_trigger 从来没被 enable 过。
#   这套包的游戏状态机是 `#steps`（0 大厅 / 1 开场 / 2 战斗 / 3 结算），
#   判断"在大厅"用 `#steps=0` 即可，不需要额外的 #state。
#
# ★ 另外：enable 只给玩家"允许 /trigger"的权限，
#   真正显示面板还需要有人读 trigger，见 statistics/read。

# 大厅里有人点了统计面板 → 显示 + 撤销（reset 会顺带收回 trigger 权限）
execute if score #steps int matches 0 as @a[team=!debug,scores={lobby_trigger=1..}] run function tkot:statistics/read

# 每 tick 补一次权限：trigger 用过一次就会被收回，不补的话只能点一次
execute if score #steps int matches 0 as @a[team=!debug] run scoreboard players enable @s lobby_trigger

# 离开大厅（开场/战斗/结算）就收回权限，避免战斗中弹出面板
execute unless score #steps int matches 0 as @a[team=!debug] run scoreboard players reset @s lobby_trigger
