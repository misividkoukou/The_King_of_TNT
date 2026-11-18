# ── 结算播报 ──
# 由 states/3/next_statu 调用，必须写在 states/reset（会把 statu 清零）之前。
#
# ★ 颜色说明：
#   组队模式（#gamemode 2/3）下玩家名字会带队伍颜色和 [红]/[蓝] 前缀，
#   如果这时再给 selector 指定 "color":"green"，名字和前缀就会一个绿一个队色 → 颜色不一致。
#   所以组队模式下不指定颜色（让队色生效），单人模式仍然是绿色。

title @a times 10 50 10

# ── 副标题 ──
execute if score #gamemode int matches 1 if entity @a[scores={statu=2}] run title @a subtitle [{"text":"胜利者 ","color":"gold"},{"selector":"@a[scores={statu=2}]","color":"green"}]
execute if score #gamemode int matches 2.. if entity @a[scores={statu=2}] run title @a subtitle [{"text":"胜利者 ","color":"gold"},{"selector":"@a[scores={statu=2}]"}]
execute unless entity @a[scores={statu=2}] run title @a subtitle [{"text":"本局无人获胜","color":"gray"}]

title @a title {"text":"本局结束","color":"red"}

# ── 聊天栏 ──
execute if score #gamemode int matches 1 if entity @a[scores={statu=2}] run tellraw @a [{"text":"胜利者：","color":"gold"},{"selector":"@a[scores={statu=2}]","color":"green"},{"text":" —— 5 秒后返回大厅","color":"gray"}]
execute if score #gamemode int matches 2.. if entity @a[scores={statu=2}] run tellraw @a [{"text":"胜利者：","color":"gold"},{"selector":"@a[scores={statu=2}]"},{"text":" —— 5 秒后返回大厅","color":"gray"}]
execute unless entity @a[scores={statu=2}] run tellraw @a [{"text":"本局无人获胜","color":"gray"},{"text":" —— 全员出局，5 秒后返回大厅","color":"gray"}]
