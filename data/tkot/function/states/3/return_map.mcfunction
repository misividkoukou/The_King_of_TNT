# 地图复位：清理参数来自 tkot:map（maps/pick 抽图时已经写好）
# 约定：x1/z1 是小的一边，x2/z2 是大的一边；y 由 #max_height 从高往低跑。

# 看门狗计时归零
scoreboard players set #reset_timer int 0

# 每张图的最高层
execute store result score #max_height int run data get storage tkot:map max_height

# 每次清几层。体积 = 宽 × 长 × 层数，fill 单条上限 32768：
#   34 × 34 × 4 = 4624  ✓ 余量很大
scoreboard players set #clear_step int 4

function tkot:states/3/map_returen/step
