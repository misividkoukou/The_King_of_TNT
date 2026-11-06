# 开始战斗：地图已经由 states/1/game_prepare 抽好并写进 tkot:map
# 这里只负责发放次数归零 + 分散落位

#物资发放次数归零
scoreboard players set #give_count int 0

# 宏的参数全部来自 tkot:map（x / z / range / y_debug）
function tkot:states/2/spread with storage tkot:map
