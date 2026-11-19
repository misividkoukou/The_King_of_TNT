# ── 硫方怪 TNT（试验品）：投射本体（上下文 = 玩家）──
# 两个入口共用这一份，避免逻辑漂移：
#   · item:sulfur_tnt/throw   吃道具触发（依赖进度：**改完进度必须退出重进存档**）
#   · item:sulfur_tnt/test    管理员直接试射（不依赖进度，用来排查"吃了没反应"）
#
# 排查顺序（出问题时按这个走）：
#   1) /function item:sulfur_tnt/test
#      能出硫方怪 → 召唤没问题，问题在进度（没重进存档 / custom_data 与进度不一致）
#      不出、聊天栏红字 → 按红字改 summon.mcfunction（实体 id / NBT / 语法）
#   2) 出了但没 TNT、不炸 → equipment.body 没被识别，看 item replace 那行是否报错

data modify storage tkot:throw lat set value 0
function item:common/aim with storage tkot:throw
execute at @s run function item:sulfur_tnt/summon with storage tkot:throw

# 反馈：成功/失败各一句（失败时聊天栏还会有原版红字说明具体原因）
execute if entity @e[type=minecraft:sulfur_cube,tag=sulfur_test_tnt,distance=..16] run tellraw @s [{"text":"[TKOT] 已投出硫方怪（试验品）","color":"gray"}]
execute unless entity @e[type=minecraft:sulfur_cube,tag=sulfur_test_tnt,distance=..16] run tellraw @s [{"text":"[TKOT] 硫方怪没有出现：看聊天栏红字或 latest.log","color":"red"}]
