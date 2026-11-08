# 5 秒停留结束：回大厅 + 开始清理场地
# 由 states/3/tick1 在 #over_wait 归零时调用
#
# 第一行把 #over_wait 设成 -1（表示"停留已结束"），
# 这样 tick1 里的倒计时和 sec1 里的"停留中"分支都不会重复触发。
#
# 停留那 5 秒是旁观、不传送；5 秒一过就照常送回大厅。
scoreboard players set #over_wait int -1

# 先把大厅结构放回去（place_lobby 只放结构，不负责传送）
function tkot:lobby/place_lobby

# 送回大厅
function tkot:states/3/tp

# 启动地图清理，完成后由 states/3/finish 收尾
function tkot:states/3/return_map
