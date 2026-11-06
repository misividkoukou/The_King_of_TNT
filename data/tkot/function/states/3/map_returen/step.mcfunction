# 一轮清理：#max_height 是本次要清的顶层层号
# 注意：临时层号存到 fy1/fy2，不能用 y1/y2 —— y1 是结构原点的 y
execute store result storage tkot:map fy1 int 1 run scoreboard players get #max_height int

# fy2 = fy1 + (#clear_step - 1)
scoreboard players operation #temp_y int = #max_height int
scoreboard players operation #temp_y int += #clear_step int
scoreboard players remove #temp_y int 1
execute store result storage tkot:map fy2 int 1 run scoreboard players get #temp_y int

# 清掉这一批（x1/z1/x2/z2 与结构模板同尺寸，来自 maps/mapN）
function tkot:states/3/map_returen/fill with storage tkot:map

# 往下走 #clear_step 层
scoreboard players operation #max_height int -= #clear_step int

# 没清完 → 2 tick 后继续；清完 → 放回结构，再收尾
execute if score #max_height int matches 0.. run schedule function tkot:states/3/map_returen/step 2t replace
execute if score #max_height int matches ..-1 run tellraw @a [{"text":"[TKOT] 清理完成，开始放地图","color":"gray"}]
execute if score #max_height int matches ..-1 run function tkot:states/3/place with storage tkot:map
