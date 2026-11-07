# 传送回大厅（坐标统一在 lobby/tp_point 里维护）
# 用 tp_all 而不是 tp_point：这个函数是结算链里被调用的，没有实体上下文，tp @s 会失败
function tkot:lobby/tp_all

# 提示走聊天栏，不占 actionbar —— actionbar 留给“复位状态”指示器
tellraw @a [{"text":"已返回大厅，等地图复位完成后即可开始下一局","color":"gray"}]
playsound entity.experience_orb.pickup master @a
