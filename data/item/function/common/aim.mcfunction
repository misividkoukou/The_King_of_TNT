# ── 公共瞄准计算（宏函数）──
# 由各变体的 throw_tnt 调用，上下文必须是玩家（要用 @s）。
# 参数：$(lat) —— 侧向偏移（单位：格），0 = 正前方，正数 = 向左
# 结果写进 storage tkot:throw 的 mx/my/mz，供各变体的 summon 宏使用。
#
# 为什么 lat 能做出扇形：
#   探针放在「前方 10 格 + 侧向 lat 格」，从眼睛到探针的连线就带上了横向分量。
#   Motion = 0.15 × (10·前方 + lat·左方) → 前进 1.5 格/刻，同时横移 0.15×lat 格/刻。
#   用 ^ 局部坐标算，所以仰视/俯视时依然正确（不会因为水平分量变小而失效）。

# 1. 探针：眼睛前方 10 格，再侧移 $(lat) 格
$execute anchored eyes run summon minecraft:marker ^$(lat) ^ ^10 {Tags:["tmp_dir"]}

# 2. 玩家位置放大 10000 倍
execute store result score $px calc_x run data get entity @s Pos[0] 10000
execute store result score $py calc_y run data get entity @s Pos[1] 10000
execute store result score $pz calc_z run data get entity @s Pos[2] 10000
# 补上眼睛高度：1.62 * 10000 = 16200
scoreboard players add $py calc_y 16200

# 3. 探针位置放大 10000 倍
execute as @e[tag=tmp_dir,limit=1] store result score @s calc_x run data get entity @s Pos[0] 10000
execute as @e[tag=tmp_dir,limit=1] store result score @s calc_y run data get entity @s Pos[1] 10000
execute as @e[tag=tmp_dir,limit=1] store result score @s calc_z run data get entity @s Pos[2] 10000

# 4. 相减 = 方向向量（已含横向分量）× 10000 倍
execute as @e[tag=tmp_dir,limit=1] run scoreboard players operation @s calc_x -= $px calc_x
execute as @e[tag=tmp_dir,limit=1] run scoreboard players operation @s calc_y -= $py calc_y
execute as @e[tag=tmp_dir,limit=1] run scoreboard players operation @s calc_z -= $pz calc_z

# 5. 换算成速度：1.5 / 10 / 10000 = 0.000015（想改速度只改这一个系数）
execute store result storage tkot:throw mx double 0.000015 run scoreboard players get @e[tag=tmp_dir,limit=1] calc_x
execute store result storage tkot:throw my double 0.000015 run scoreboard players get @e[tag=tmp_dir,limit=1] calc_y
execute store result storage tkot:throw mz double 0.000015 run scoreboard players get @e[tag=tmp_dir,limit=1] calc_z

# 6. 删探针
kill @e[tag=tmp_dir]
