# 重试 3 次仍然清不完 → 放弃，强制收尾，但要明确告诉玩家地图可能不干净
tellraw @a [{"text":"[TKOT] ","color":"red"},{"text":"地图复位失败（已重试 3 次），已强制收尾。请检查 forceload 与 fill 的坐标。","color":"yellow"}]

function tkot:states/3/finish
