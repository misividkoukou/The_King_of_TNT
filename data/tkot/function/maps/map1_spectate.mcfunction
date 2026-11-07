# 地图 48*48*48 的场地判定与边界
# 包围盒：x 0..47，y 0..60，z -48..-1（与结构模板同尺寸，y 多留 13 格给观战者）
# 大厅在 x 0..47 / z 200..247 / y -56 起，z 方向完全不相交，不会误判。

# 重算 in_arena（这是位置状态，不是身份，所以仍然用 tag）
execute as @a at @s if entity @s[x=0,y=0,z=-48,dx=48,dy=61,dz=48] run tag @s add in_arena
execute as @a at @s unless entity @s[x=0,y=0,z=-48,dx=48,dy=61,dz=48] run tag @s remove in_arena

# 边界：本局存活（statu=2）离开场地 → 判死。
# 以后做缩圈，就是把上面的包围盒逐圈改小，这条不用动。
execute as @a[scores={statu=2},tag=!in_arena] run function tkot:states/2/mechanics/damage

# 观战者（statu 3=已淘汰 / 4=局外闯入）不许飞出场地：出界拉回观察点。
# 观察点坐标取 tkot:map 的 (x, y_debug, z)，不再硬编码 24 60 -24（那边改地图时只改一处）
$execute as @a[scores={statu=3..4}] at @s unless entity @s[x=0,y=0,z=-48,dx=48,dy=61,dz=48] run tp @s $(x) $(y_debug) $(z)
