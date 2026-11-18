# 在随机坐标生成一颗"超级高爆tnt"
#
# 宏参数 x / y / z 来自 random.mcfunction 传进来的 compound（tnt:spawn 的 pos 子节点）。
# 数据存成 pos:{x,y,z} 的好处：清空时可以用一条 data modify 把 pos 整体重置。
#
# 早期版本还带 CustomName:{text:"...",color:red}，red 没加引号会让 SNBT 解析失败，
# 整条 summon 不执行 —— 已去掉，靠 Glowing 光效辨认。
$summon minecraft:tnt $(x) $(y) $(z) {fuse:120,explosion_power:6,Glowing:true}

# 清空临时坐标（把 pos 整体设成空 compound）
data modify storage tnt:spawn pos set value {}
