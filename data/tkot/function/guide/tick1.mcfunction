# ── 图鉴入口门控（每 tick，由 ticks/tick1 调用）──
# 照抄 statistics/tick1 的三段式：
#   ① 大厅里有人把 guide_trigger 设成 ≥1 → 打开图鉴（guide/open 负责 show + reset）
#   ② 每 tick 补一次 trigger 权限（trigger 用过一次就会被收回，不补只能点一次）
#   ③ 离开大厅（开场/战斗/结算）就收回权限并清分，战斗中点了也无效
#
# ★ 只负责"打开"，不负责翻页：页间跳转全在 dialog JSON 里用 show_dialog 动作完成，
#   不需要 trigger，也不需要命令。

# 大厅里有人点了图鉴 → 打开 + 撤销（reset 会顺带收回 trigger 权限）
execute if score #steps int matches 0 as @a[team=!debug,scores={guide_trigger=1..}] run function tkot:guide/open

# 每 tick 补一次权限
execute if score #steps int matches 0 as @a[team=!debug] run scoreboard players enable @s guide_trigger

# 离开大厅就收回权限，避免战斗中弹出对话框
execute unless score #steps int matches 0 as @a[team=!debug] run scoreboard players reset @s guide_trigger
