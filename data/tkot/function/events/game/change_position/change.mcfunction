# 1. 随机挑一个"不在自己脚下"的位置记录点，并在那里生成一个临时锚点
# ★ at @s 必须是第一个：distance 是按执行位置算的，
#   没先 at @s 的话它就变成"相对命令源"而不是"相对自己"，排除自己脚下的逻辑会失效。
execute at @s at @e[type=armor_stand,tag=swap_pos,distance=0.1..,limit=1,sort=random] run summon minecraft:marker ~ ~ ~ {Tags:["target_pos"]}

# 2. 把自己传送到锚点位置
execute if entity @e[type=minecraft:marker,tag=target_pos] run tp @s @e[type=minecraft:marker,tag=target_pos,limit=1]

# 3. 销毁自己刚刚认领的那个位置记录点（防止别人再传过来）
execute at @s run kill @e[type=armor_stand,tag=swap_pos,distance=..0.1,limit=1]

# 4. 清理临时锚点
execute if entity @e[type=minecraft:marker,tag=target_pos] run kill @e[type=minecraft:marker,tag=target_pos]
