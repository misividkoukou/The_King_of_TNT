# 收回进度
advancement revoke @s only item:tnt_stick
# 不在这里 clear：物品带 consumable 组件，使用时会自动扣掉 1 个。
# 原来那行 clear 用的键是 my_tnt_item，和物品实际的 {tnt:true} 对不上，永远不会命中；
# 若哪天发现弹药不减少，再把 clear 加回来，键名写 custom_data~{tnt:true}

# 1. 在眼睛前方 10 格生成标记（距离拉远，避免误差）
execute anchored eyes run summon minecraft:armor_stand ^ ^ ^10 {Tags:["tmp_dir"],NoGravity:1b,Marker:1b,Invisible:1b}

# 2. 获取玩家脚部坐标（放大 10000 倍）
execute store result score $px calc_x run data get entity @s Pos[0] 10000
execute store result score $py calc_y run data get entity @s Pos[1] 10000
execute store result score $pz calc_z run data get entity @s Pos[2] 10000

# 3. 关键：把玩家Y轴补上眼睛高度 1.62 (1.62 * 10000 = 16200)
scoreboard players add $py calc_y 16200

# 4. 获取标记实体坐标（放大 10000 倍）
execute as @e[tag=tmp_dir,limit=1] store result score @s calc_x run data get entity @s Pos[0] 10000
execute as @e[tag=tmp_dir,limit=1] store result score @s calc_y run data get entity @s Pos[1] 10000
execute as @e[tag=tmp_dir,limit=1] store result score @s calc_z run data get entity @s Pos[2] 10000

# 5. 相减得到方向向量（此时差值为：方向 * 10格 * 10000倍）
execute as @e[tag=tmp_dir,limit=1] run scoreboard players operation @s calc_x -= $px calc_x
execute as @e[tag=tmp_dir,limit=1] run scoreboard players operation @s calc_y -= $py calc_y
execute as @e[tag=tmp_dir,limit=1] run scoreboard players operation @s calc_z -= $pz calc_z

# 6. 存入 storage
# 计算公式：1.5 (固定速度) / 10 (探针距离) / 10000 (放大倍数) = 0.000015
# 想改速度就直接改这个数值（例如速度 2.0 = 0.00002）
execute store result storage tkot:throw mx double 0.000015 run scoreboard players get @e[tag=tmp_dir,limit=1] calc_x
execute store result storage tkot:throw my double 0.000015 run scoreboard players get @e[tag=tmp_dir,limit=1] calc_y
execute store result storage tkot:throw mz double 0.000015 run scoreboard players get @e[tag=tmp_dir,limit=1] calc_z

# 7. 移除标记实体
kill @e[tag=tmp_dir]

# 8. 执行宏召唤 TNT
execute at @s run function item:tnt/throw_tnt_with_macro with storage tkot:throw