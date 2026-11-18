# ── 读取大厅统计面板的 trigger（上下文 = 点了面板的玩家）──
# 由 statistics/tick1 调用。
#
# trigger 的一次性语义：玩家 /trigger 之后会自动失去权限、分数保留，
# 所以这里先用分数调展示函数，再 reset 把分数和权限一起清掉，
# 下一 tick 由 statistics/tick1 重新 enable，玩家才能再点。

function tkot:statistics/show
scoreboard players reset @s lobby_trigger
