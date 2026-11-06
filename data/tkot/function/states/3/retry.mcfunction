# 复位超时 → 重来一次（自愈）
scoreboard players add #reset_retry int 1

# 注意：要显示分数值必须用 {"score":{...}}，直接写文字只会打印字面量
tellraw @a [{"text":"[TKOT] ","color":"red"},{"text":"地图复位超时，正在重试（第 "},{"score":{"name":"#reset_retry","objective":"int"},"color":"yellow"},{"text":" 次）…","color":"yellow"}]

# return_map 会把 #reset_timer 归零、把 #max_height 重置回最高层，然后重新开始逐层清理
function tkot:states/3/return_map
