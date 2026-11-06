# 清理完成 → 卸强加载 → 回合复位 → 放开状态机

# 按地图卸强加载（必须和 maps/pick 里 add 的那组完全一致，否则卸不掉）
# forceload 用方块坐标 (x1 z1 x2 z2)，和 pick 里保持一致
execute if score #map_num int matches 1 run forceload remove 0 -48 47 -1

function tkot:states/reset
scoreboard players set #steps int 0

# 最后再保一次：结算瞬间正在重生的玩家可能错过前面的传送，这里收尾补上
function tkot:lobby/tp_all

tellraw @a {"text":"地图已复位，可以开始新一轮了","color":"green"}
playsound entity.villager.yes master @a
