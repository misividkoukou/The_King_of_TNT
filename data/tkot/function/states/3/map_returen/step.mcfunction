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
# 终止条件必须是 -3.. 而不是 0..：
#   每轮清 fy1..fy1+3 然后 -=4，最后一轮 fy1=3 清 3..6，减完变 -1；
#   若用 0.. 就停在这里，y=0/1/2 三层永远清不到。
#   用 -3.. 会再跑一轮 fy1=-1 清 -1..2，正好补上最低 3 层（含地板下一层）。
execute if score #max_height int matches -3.. run schedule function tkot:states/3/map_returen/step 2t replace
# 放置条件必须跟着改成 ..-4（即“已经跑不动了”），不能再用 ..-1：
#   max=-1 那一轮既要继续清 -1..2，又会满足 ..-1 → 提前放地图，
#   2 tick 后那次 fill 就会把刚放好的地图底下 3 层清成空气。
execute if score #max_height int matches ..-4 run tellraw @a [{"text":"[TKOT] 清理完成，开始放地图","color":"gray"}]
execute if score #max_height int matches ..-4 run function tkot:states/3/place with storage tkot:map
