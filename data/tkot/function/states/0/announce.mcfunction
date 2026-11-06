# 每次刷新都重设一次 title 时长：
# stop_countdown 为了“取消提示”把 times 改成了 0 20 0，不重置的话后面所有 title 都会没有淡入淡出
title @a times 10 20 10

$title @a actionbar [{"text":"可开始 ","color":"green"},{"text":"│ ","color":"dark_gray"},{"text":"已有 ","color":"aqua"},{"text":"$(prepare)","color":"yellow"},{"text":" / ","color":"aqua"},{"text":"$(total)","color":"white"},{"text":" 人准备","color":"aqua"}]
$execute if score #prepare sec matches 0.. run title @a actionbar [{"text":"准备完毕 · ","color":"gold"},{"text":"$(sec)","color":"yellow","bold":true},{"text":" 秒后开始","color":"gold"}]
