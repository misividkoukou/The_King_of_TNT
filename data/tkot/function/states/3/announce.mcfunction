# ── 结算播报 ──
# 由 states/3/next_statu 调用，必须写在 states/reset（会把 statu 清零）之前。
# 分两种情况：有胜者 / 无人获胜（全员出局）。

title @a times 10 50 10

# 副标题
execute if entity @a[scores={statu=2}] run title @a subtitle [{"text":"胜利者 ","color":"gold"},{"selector":"@a[scores={statu=2}]","color":"green"}]
execute unless entity @a[scores={statu=2}] run title @a subtitle [{"text":"本局无人获胜","color":"gray"}]

title @a title {"text":"本局结束","color":"red"}

# 聊天栏
execute if entity @a[scores={statu=2}] run tellraw @a [{"text":"胜利者：","color":"gold"},{"selector":"@a[scores={statu=2}]","color":"green"},{"text":" —— 5 秒后返回大厅","color":"gray"}]
execute unless entity @a[scores={statu=2}] run tellraw @a [{"text":"本局无人获胜","color":"gray"},{"text":" —— 全员出局，5 秒后返回大厅","color":"gray"}]
