# 召唤一颗"装着 TNT 的硫方怪"（由 sulfur_tnt/throw 调用一次）
#
# equipment.body = 它吸收的方块；填 minecraft:tnt 就会自动推导成 Explosive 原型
#   （Java 版原型由方块推导，不存在独立的 archetype NBT 字段）
# fuse = 引信，-1 表示未点燃；这里直接给 90 tick（4.5 秒），
#   留足时间观察弹跳，到点按 Explosive 原型的爆炸参数炸掉（炸完不分裂小方块）。
# tags：thrown_tnt 让 states/reset 的 kill @e[tag=thrown_tnt] 能清掉；
#       sulfur_test_tnt 只用于下面 attribute 定位最近这一颗。
$summon minecraft:sulfur_cube ~ ~1.62 ~ {Tags:["thrown_tnt","sulfur_test_tnt"],fuse:90,equipment:{body:{id:"minecraft:tnt",count:1}},Motion:[$(mx)d,$(my)d,$(mz)d]}

# 弹性拉满（26.2 新增属性，0..1，默认 0）：用来测"落地恢复系数"到底能弹多高
$attribute @e[type=minecraft:sulfur_cube,tag=sulfur_test_tnt,limit=1,sort=nearest] minecraft:bounciness base set 1.0
