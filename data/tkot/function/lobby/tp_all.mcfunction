# 大厅传送点 —— 所有人
# 真正的坐标只在 tp_point.mcfunction 里维护，这里只负责“对所有人执行一次”。
# 注意：这里绝不能调 place_lobby —— place_lobby 成功后又会调 tp_all，会形成无限递归。
execute as @a run function tkot:lobby/tp_point
