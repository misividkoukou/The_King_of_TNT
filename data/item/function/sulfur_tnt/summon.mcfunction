# 召唤一颗"装着 TNT 的硫方怪"（由 sulfur_tnt/test 调用一次）
#
# ★ 先"裸召唤"，再单独塞方块：这样即使某条写入语句不被这个版本接受，
#   实体也已经出现了（便于判断到底是"召唤失败"还是"内容没塞进去"）。
# ★ Java 版硫方怪没有独立 archetype NBT，原型由 equipment.body 里的方块推导；
#   填 minecraft:tnt 就走 Explosive 原型。
# ★ fuse = 引信，-1 未点燃；这里给 90 tick（4.5 秒）直接点燃，留时间看弹跳。
#   tags：thrown_tnt 让 states/reset 能清掉；sulfur_test_tnt 给下面几行定位。
$summon minecraft:sulfur_cube ~ ~1.62 ~ {Tags:["thrown_tnt","sulfur_test_tnt"],fuse:90,Motion:[$(mx)d,$(my)d,$(mz)d]}

# 塞入 TNT：两条路径都试一次，谁被这个版本接受就用谁
#   ① data modify：直接写装备槽（wiki 记载的存档位置就是 equipment.body）
#   ② item replace：往 body 槽塞（armor.body）。实体没有该槽时只会报错，不影响召唤
data modify entity @e[type=minecraft:sulfur_cube,tag=sulfur_test_tnt,limit=1,sort=nearest] equipment.body set value {id:"minecraft:tnt",count:1}
item replace entity @e[type=minecraft:sulfur_cube,tag=sulfur_test_tnt,limit=1,sort=nearest] armor.body with minecraft:tnt

# 弹性拉满（26.2 新增属性，0..1，默认 0，1.0 = 落地几乎不衰减）
$attribute @e[type=minecraft:sulfur_cube,tag=sulfur_test_tnt,limit=1,sort=nearest] minecraft:bounciness base set 1.0
